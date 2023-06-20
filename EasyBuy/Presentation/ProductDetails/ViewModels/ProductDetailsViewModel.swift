import Foundation
import Apollo

class ProductViewModel: ObservableObject {
    @Published var product: DataClass?
    var productId: GraphQLID?
    @Published var cart: DraftOrderDataClass?
    @Published var favorite: DraftOrderDataClass?
    @Published var varaintID: String?
    @Published var favoriteVaraintID: String?
    @Published var isExist = false
    @Published var isLoading: Bool = true
    @Published var iserror: Bool = false
    @Published var isFavoriteExist = false
    @Published var quantity: Int = 1
    @Published var availableQuantity: Int = 1
    @Published var price: String = "100"
    @Published var isComplete = false
    @Published var isLoadingCart = false
    @Published var isfailedCart = false
    @Published var isShowAlet = false
    
//    @Published var favoriteProductID = ""
    let customerID = UserDefaults.standard.string(forKey:"shopifyCustomerID")
    let email = UserDefaults.standard.string(forKey:"email")
    
    init(productId: GraphQLID?) {
        self.productId = productId
    }
    
    func fetchProductDetails() {
        checkFavoriteDraftOrder()
        print("isFavoriteExist initially: \(isFavoriteExist)")
        guard let productId = productId else { return }
        let query = ProductDetailsQuery(productId: productId, imageFirst: 10, variantsFirst: 10)
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query: query, responseModel: DataClass.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.product = data
                self?.favoriteVaraintID = data.product?.variants?.edges?.first?.node?.id
                self?.isLoading = false
//                self?.favoriteProductID = data.product?.id ?? ""
                self?.price = data.product?.variants?.edges?.first?.node?.price?.amount ?? "Not available"
                if (self?.product?.product?.variants?.edges?.first?.node?.quantityAvailable ?? 3)/3  < 1{
                    self?.availableQuantity = 1
                }
                else{
                    self?.availableQuantity = (self?.product?.product?.variants?.edges?.first?.node?.quantityAvailable ?? 3)/3
                }
               
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
                                if self?.varaintID?.isEmpty == true || self?.varaintID != nil{
                                    lineItems.append(DraftOrderLineItemInput(quantity: self?.quantity ?? 1,variantId:  self?.varaintID))
                                    print("products in lines items id \(String(describing: lineItems))")
                                    self?.UpdateDraftOrder(id: objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id ?? "", draftOrderInput: DraftOrderInput(lineItems: lineItems), customerDiscountCodes: objFireBase ?? CustomerDiscountCodes())
                                }
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
                                            [DraftOrderLineItemInput(quantity: quantity,variantId: varaintID)])
        
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderCreateMutation(input: linesItems), responseModel: DraftOrderDataClass.self) {[weak self] result in
            print(result)
            switch result {
            case .success(let success):
                if let lineItemsCount = success.draftOrderCreate?.draftOrder?.lineItems?.nodes?.count{
                    self?.cart = success
                    UserDefaults.standard.set(lineItemsCount, forKey: "count")
                    self?.isComplete = true
                    self?.isLoadingCart = false
                    self?.isfailedCart = false
                    DispatchQueue.main.asyncAfter(deadline: .now()+2){
                        self?.isShowAlet = false
                    }
                    
                    FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: self?.customerID,discountCodes: discountCodes, draftOrders: DraftOrders(favoriteDraftorder: self?.favorite, cartDraftOrder: success)))
             
                }
                else{
                    self?.isComplete = false
                    self?.isLoadingCart = false
                    self?.isfailedCart = true
                    DispatchQueue.main.asyncAfter(deadline: .now()+2){
                        self?.isShowAlet = false
                    }
                    print("no line items")
                    
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }

    func UpdateDraftOrder(id: String,draftOrderInput: DraftOrderInput,customerDiscountCodes: CustomerDiscountCodes){
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderUpdateMutation(id: id, input: draftOrderInput), responseModel: UpdateDraftOrderDataClass.self) {[weak self] res in
            switch res {
            case .success(let success):
                if let lineItemsCount = success.draftOrderUpdate?.draftOrder?.lineItems?.nodes?.count{
                    UserDefaults.standard.set(lineItemsCount, forKey: "count")
                    self?.isComplete = true
                    self?.isLoadingCart = false
                    self?.isfailedCart = false
                    DispatchQueue.main.asyncAfter(deadline: .now()+2){
                        self?.isShowAlet = false
                    }
                    
                    FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: customerDiscountCodes.id,discountCodes: customerDiscountCodes.discountCodes,draftOrders: DraftOrders(favoriteDraftorder: self?.favorite, cartDraftOrder: DraftOrderDataClass(draftOrderCreate: DraftOrderCreate(draftOrder: success.draftOrderUpdate?.draftOrder)))))
                }
                else{
                    self?.isComplete = false
                    self?.isLoadingCart = false
                    self?.isfailedCart = true
                    DispatchQueue.main.asyncAfter(deadline: .now()+2){
                        self?.isShowAlet = false
                    }
                    print("no line items")
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }

    
    
    func checkFavoriteDraftOrder() {
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument(completion: { [weak self] snapshot, error in
            
            if let error = error {
                print("Failed to fetch current user:", error)
                return
            }
            guard let data = snapshot?.data() else {
                print("no data found")
                return
            }
            
            let objFireBase = FireBaseManager.shared.mapFireBaseObject(data: data)
            self?.favorite = objFireBase?.draftOrders?.favoriteDraftorder
            self?.cart = objFireBase?.draftOrders?.cartDraftOrder
            
            if self?.favorite == nil{
                return
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
                            if lineItems.contains(where: {$0.variantId == self?.favoriteVaraintID}){
                                self?.isFavoriteExist = true
                                self?.isLoading = false
                                print("isFavoriteExist after call: \(String(describing: self?.isFavoriteExist))")
                            }
                            else {
                                self?.isLoading = false
                                print("isFavoriteExist after call: false")
                            }
                        case .failure(let failure):
                            print(failure)
                        }
                        }
                    }
                
                
            }//
        })
    }
    
    func getFavoriteDraftOrder()  {
        isFavoriteExist = true
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
            
//            if let products = objFireBase?.draftOrders?.favoriteDraftorder?.draftOrderCreate?.draftOrder?.lineItems?.nodes {
//                for product in products {
//                    if product.id == self?.product?.product?.id {
//                        self?.isFavoriteExist = true
//                        break
//                    }
//                }
//            }
            
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
                            if lineItems.contains(where: {$0.variantId == self?.favoriteVaraintID}){
                                self?.isFavoriteExist = true
                              
                                print("isFavoriteExist after call: \(String(describing: self?.isFavoriteExist))")
                            }
                            else {
                               // self?.isFavoriteExist = false
                                lineItems.append(DraftOrderLineItemInput(
                                    quantity: 1,
                                    variantId:  self?.favoriteVaraintID
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
            lineItems: [DraftOrderLineItemInput(quantity: quantity,variantId: favoriteVaraintID)]
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
    func getAvailableQuantityForProduct(){
        let product = self.product?.product?.variants?.edges?.filter({$0.node?.id == varaintID})
        if (product?.first?.node?.quantityAvailable ?? 3)/3  < 1{
           availableQuantity = 1
        }
        else{
            availableQuantity = (product?.first?.node?.quantityAvailable ?? 3)/3
        }
      
    }
}
