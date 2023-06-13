import Foundation
import Apollo

class ProductViewModel: ObservableObject {
    @Published var product: DataClass?
    var productId: GraphQLID?
    @Published var cart: DraftOrderDataClass?
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
            if self?.cart == nil{
                self?.createDraftOrder(discountCodes: objFireBase?.discountCodes ?? [])
            }
            else{
                print((objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id)!)
                NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query: DraftOrderQuery(id: (objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id)!), responseModel: DraftOrderCreate.self) {[weak self] res in
                    switch res {
                    case .success(let success):
                        var  lineItems: [DraftOrderLineItemInput] = []
                        lineItems = self?.mapLineItemsToDratOrderLineItems(lineItems: success.draftOrder?.lineItems?.nodes ?? []) ?? []
                        lineItems.append(DraftOrderLineItemInput(quantity: 1,variantId:  self?.product?.product?.variants?.edges?.first?.node?.id))
                        print("products in lines items id \(String(describing: lineItems))")
                        self?.UpdateDraftOrder(id: objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id ?? "", draftOrderInput: DraftOrderInput(lineItems: lineItems), customerDiscountCodes: objFireBase ?? CustomerDiscountCodes())
                    case .failure(let failure):
                        print(failure)
                    }
                }

            }
        })
    }
    
    func mapLineItemsToDratOrderLineItems(lineItems: [LinesItemNode]?) -> [DraftOrderLineItemInput]{
      
        var draftOrderLineItemInputs: [DraftOrderLineItemInput] = []
        for item in lineItems ?? []{
            let draftLineItem = DraftOrderLineItemInput(quantity: 1,variantId: item.variant?.id)
            draftOrderLineItemInputs.append(draftLineItem)
        }
        return draftOrderLineItemInputs
    }
    
    func createDraftOrder(discountCodes: [String]){

        // change variant with the choice of size

        let linesItems = DraftOrderInput(email: email, lineItems:
                                            [DraftOrderLineItemInput(quantity: 1,variantId: product?.product?.variants?.edges?.first?.node?.id)])
        
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderCreateMutation(input: linesItems), responseModel: DraftOrderDataClass.self) {[weak self] result in
            print(result)
            switch result {
            case .success(let success):
                self?.cart = success
                FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: self?.customerID,discountCodes: discountCodes, draftOrders: DraftOrders(cartDraftOrder: success)))
            case .failure(let failure):
                print(failure)
            }
        }
    }

    func UpdateDraftOrder(id: String,draftOrderInput: DraftOrderInput,customerDiscountCodes: CustomerDiscountCodes){
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderUpdateMutation(id: id, input: draftOrderInput), responseModel: UpdateDraftOrderDataClass.self) { res in
            switch res {
            case .success(let success):
                FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: customerDiscountCodes.id,discountCodes: customerDiscountCodes.discountCodes,draftOrders: DraftOrders(cartDraftOrder: DraftOrderDataClass(draftOrderCreate: DraftOrderCreate(draftOrder: success.draftOrderUpdate?.draftOrder)))))
            case .failure(let failure):
                print(failure)
            }
        }
    }

    func addToCart(){
        
    }
    
}

