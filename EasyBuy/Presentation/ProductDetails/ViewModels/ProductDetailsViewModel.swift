import Foundation
import Apollo

class ProductViewModel: ObservableObject {
    @Published var product: DataClass?
    var productId: GraphQLID?
    @Published var cart: DraftOrderDataClass?
    @Published var favorite: DraftOrderDataClass?
    @Published var varaintID: String?
    @Published var isExist = false
    @Published var isFavoriteExist = false
    let customerID = UserDefaults.standard.string(forKey:"shopifyCustomerID")
    let email = UserDefaults.standard.string(forKey:"email")
    
    init(productId: GraphQLID?) {
        self.productId = productId
    }
    
    func fetchProductDetails() {
       
        guard let productId = productId else { return }
        let query = ProductDetailsQuery(productId: productId, imageFirst: 10, variantsFirst: 10)
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query: query, responseModel: DataClass.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.product = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getDraftOrder(){
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument(completion: { [weak self] snapshot, error in

            if let error = error {
                print("Failed to fetch current user:", error)
                return
            }
            guard let data = snapshot?.data() else {
                print("no data found")
                self?.createDraftOrder(discountCodes: [])
                return
            }
            
            let objFireBase = FireBaseManager.shared.mapFireBaseObject(data: data)
            self?.cart = objFireBase?.draftOrders?.cartDraftOrder
            self?.favorite = objFireBase?.draftOrders?.favoriteDraftorder
            
            if self?.cart == nil{
                self?.createDraftOrder(discountCodes: objFireBase?.discountCodes ?? [])
            }
            else{
                if let draftOrderID = objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id{
                    print((objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id)!)
                    NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query: DraftOrderQuery(id: draftOrderID), responseModel: DraftOrderCreate.self) {[weak self] res in
                        switch res {
                        case .success(let success):
                            var  lineItems: [DraftOrderLineItemInput] = []
                            lineItems = mapLineItemsToDratOrderLineItems(lineItems: success.draftOrder?.lineItems?.nodes ?? [])
                            if lineItems.contains(where: {$0.variantId == self?.varaintID}){
                                self?.isExist = true
                            }
                            else{
                                self?.isExist = false
                                lineItems.append(DraftOrderLineItemInput(quantity: 1,variantId:  self?.varaintID))
                                print("products in lines items id \(String(describing: lineItems))")
                                self?.UpdateDraftOrder(id: objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id ?? "", draftOrderInput: DraftOrderInput(lineItems: lineItems), customerDiscountCodes: objFireBase ?? CustomerDiscountCodes())
                            }
                         
                        case .failure(let failure):
                            print(failure)
                        }
                    }
                }


            }
        })
    }
    
  
    func createDraftOrder(discountCodes: [String]){

        // change variant with the choice of size

        let linesItems = DraftOrderInput(email: email, lineItems:
                                            [DraftOrderLineItemInput(quantity: 1,variantId: varaintID)])
        
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderCreateMutation(input: linesItems), responseModel: DraftOrderDataClass.self) {[weak self] result in
            print(result)
            switch result {
            case .success(let success):
                self?.cart = success
                FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: self?.customerID,discountCodes: discountCodes, draftOrders: DraftOrders(favoriteDraftorder: self?.favorite, cartDraftOrder: success)))
            case .failure(let failure):
                print(failure)
            }
        }
    }

    func UpdateDraftOrder(id: String,draftOrderInput: DraftOrderInput,customerDiscountCodes: CustomerDiscountCodes){
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderUpdateMutation(id: id, input: draftOrderInput), responseModel: UpdateDraftOrderDataClass.self) { res in
            switch res {
            case .success(let success):
                FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: customerDiscountCodes.id,discountCodes: customerDiscountCodes.discountCodes,draftOrders: DraftOrders(favoriteDraftorder: self.favorite, cartDraftOrder: DraftOrderDataClass(draftOrderCreate: DraftOrderCreate(draftOrder: success.draftOrderUpdate?.draftOrder)))))
            case .failure(let failure):
                print(failure)
            }
        }
    }

    func addToCart(){
        
    }
    
    func getFavoriteDraftOrder() {
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument(completion: { [weak self] snapshot, error in
            
            if let error = error {
                print("Failed to fetch current user:", error)
                return
            }
            guard let data = snapshot?.data() else {
                print("no data found")
                self?.createFavoriteDraftOrder(discountCodes: [])
                return
            }
            
            let objFireBase = FireBaseManager.shared.mapFireBaseObject(data: data)
            self?.favorite = objFireBase?.draftOrders?.favoriteDraftorder
            self?.cart = objFireBase?.draftOrders?.cartDraftOrder
            
            if self?.favorite == nil{
                self?.createFavoriteDraftOrder(discountCodes: objFireBase?.discountCodes ?? [])
            }
            else{
                if let draftOrderID = objFireBase?.draftOrders?.favoriteDraftorder?.draftOrderCreate?.draftOrder?.id{
                    print((objFireBase?.draftOrders?.favoriteDraftorder?.draftOrderCreate?.draftOrder?.id)!)
                    NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(
                        query: DraftOrderQuery(id: draftOrderID),
                        responseModel: DraftOrderCreate.self
                    ) {[weak self] res in
                        switch res {
                        case .success(let success):
                            var  lineItems: [DraftOrderLineItemInput] = []
                            lineItems = mapLineItemsToDratOrderLineItems(lineItems: success.draftOrder?.lineItems?.nodes ?? [])
                            if lineItems.contains(where: {$0.variantId == self?.varaintID}){
                                self?.isFavoriteExist = true
                            }
                            else {
                                self?.isFavoriteExist = false
                                lineItems.append(DraftOrderLineItemInput(
                                    quantity: 1,
                                    variantId:  self?.varaintID
                                ))
                                print("products in lines items id \(String(describing: lineItems))")
                                self?.updateFvoriteDraftOrder (
                                    id: objFireBase?.draftOrders?.favoriteDraftorder?.draftOrderCreate?.draftOrder?.id ?? "",
                                    draftOrderInput: DraftOrderInput(
                                        lineItems: lineItems),
                                    customerDiscountCodes: objFireBase ?? CustomerDiscountCodes()
                                )
                            }
                            
                        case .failure(let failure):
                            print(failure)
                        }
                    }
                }
            }
        })
    }
    
    func createFavoriteDraftOrder(discountCodes: [String]) {
        let linesItems = DraftOrderInput(
            lineItems: [DraftOrderLineItemInput(quantity: 1,variantId: varaintID)]
        )
        
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(
            mutation: DraftOrderCreateMutation(input: linesItems),
            responseModel: DraftOrderDataClass.self
        ) { [weak self] result in
            print(result)
            switch result {
            case .success(let success):
                self?.favorite = success
                FireBaseManager.shared.saveCustomerDiscountCodes(
                    customerDiscountCodes: CustomerDiscountCodes(
                        id: self?.customerID,
                        discountCodes: discountCodes,
                        draftOrders: DraftOrders(
                            favoriteDraftorder: success,
                            cartDraftOrder: self?.cart
                        )
                    )
                )
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
    
    func updateFvoriteDraftOrder(id: String, draftOrderInput: DraftOrderInput, customerDiscountCodes: CustomerDiscountCodes){
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(
            mutation: DraftOrderUpdateMutation(
                id: id,
                input: draftOrderInput),
            responseModel: UpdateDraftOrderDataClass.self)
        { res in
            switch res {
            case .success(let success):
                FireBaseManager.shared.saveCustomerDiscountCodes(
                    customerDiscountCodes: CustomerDiscountCodes(
                        id: customerDiscountCodes.id,
                        discountCodes: customerDiscountCodes.discountCodes,
                        draftOrders: DraftOrders(
                            favoriteDraftorder: DraftOrderDataClass(
                                draftOrderCreate: DraftOrderCreate(
                                    draftOrder: success.draftOrderUpdate?.draftOrder
                                )
                            ),
                            cartDraftOrder: self.cart
                        )
                    )
                )
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
//    func updateFavoriteDraftOrder(id: String, draftOrderInput: DraftOrderInput, customerDiscountCodes: CustomerDiscountCodes) {
//        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument(completion: { [weak self] snapshot, error in
//            if let error = error {
//                print("Failed to fetch current user:", error)
//                return
//            }
//            guard let data = snapshot?.data() else {
//                print("no data found")
//                self?.createFavoriteDraftOrder(discountCodes: [])
//                return
//            }
//            let objFireBase = FireBaseManager.shared.mapFireBaseObject(data: data)
//            if let cartDraftOrder = objFireBase?.draftOrders?.cartDraftOrder {
//                let updatedDraftOrders = DraftOrders(favoriteDraftorder: self?.favorite, cartDraftOrder: cartDraftOrder)
//                let customerDiscountCodes = CustomerDiscountCodes(
//                    id: customerDiscountCodes.id,
//                    discountCodes: customerDiscountCodes.discountCodes,
//                    draftOrders: updatedDraftOrders
//                )
//                FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: customerDiscountCodes)
//            } else {
//                NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderUpdateMutation(id: id, input: draftOrderInput), responseModel: UpdateDraftOrderDataClass.self) { res in
//                    switch res {
//                    case .success(let success):
//                        FireBaseManager.shared.saveCustomerDiscountCodes(
//                            customerDiscountCodes: CustomerDiscountCodes(
//                                id: customerDiscountCodes.id,
//                                discountCodes: customerDiscountCodes.discountCodes,
//                                draftOrders: DraftOrders(
//                                    favoriteDraftorder: DraftOrderDataClass(
//                                        draftOrderCreate: DraftOrderCreate(draftOrder: success.draftOrderUpdate?.draftOrder)
//                                    )
//                                )
//                            )
//                        )
//                    case .failure(let failure):
//                        print(failure)
//                    }
//                }
//            }
//        })
//    }
}
