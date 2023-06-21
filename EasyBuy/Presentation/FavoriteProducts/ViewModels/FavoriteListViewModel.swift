import Foundation

class FavoriteListViewModel : ObservableObject {
    
    @Published var products: [LinesItemNode]?
    @Published var draftOrderID: String?
    @Published var customerDiscountCodes: CustomerDiscountCodes?
    @Published var isLoading = true
    var draftOrderDataClass: DraftOrderDataClass?
    
    func getFavoriteProducts() {
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument(completion: {[weak self] snapshot, error in
            
            if let error = error {
                print("Failed to fetch current user:", error)
                self?.isLoading = false
                return
            }
            
            guard let data = snapshot?.data() else {
                print("no data found")
                self?.products = []
                self?.isLoading = false
                return
            }
            
            let objFireBase = FireBaseManager.shared.mapFireBaseObject(data: data)
            if let id = objFireBase?.draftOrders?.favoriteDraftorder?.draftOrderCreate?.draftOrder?.id {
                self?.draftOrderID = id
            } else {
                self?.isLoading = false
            }
            self?.customerDiscountCodes = objFireBase ?? CustomerDiscountCodes()
            self?.getDraftOrders(id: self?.draftOrderID ?? "")
            self?.draftOrderDataClass = objFireBase?.draftOrders?.cartDraftOrder
        })
    }
    
    private func getDraftOrders(id: String) {
        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(
            query: DraftOrderQuery(id: id),
            responseModel: DraftOrderCreate.self
        ) { [weak self] res in
            switch res {
            case .success(let success):
                self?.products = success.draftOrder?.lineItems?.nodes
                self?.isLoading = false
            case .failure(let failure):
                print(failure)
                self?.products = []
                self?.isLoading = false
            }
        }
    }
    
    func deleteFavoriteProduct(indexSet: IndexSet) {
        products?.remove(atOffsets: indexSet)
        
        let lineItems = mapLineItemsToDratOrderLineItems(lineItems: products)
        
        if lineItems.isEmpty {
            NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(
                mutation: DraftOrderDeleteMutation(
                    input: DraftOrderDeleteInput(id: draftOrderID ?? "")),
                responseModel: DeleteDraftOrderDataClass.self
            ) { res in
                switch res{
                case .success(let success):
                    print(success)
                    FireBaseManager.shared.removeFavoriteFromFireBase()
                case .failure(let failure):
                    print(failure)
                }
            }
        } else {
            NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(
                mutation: DraftOrderUpdateMutation(
                    id: draftOrderID ?? " ",
                    input: DraftOrderInput(lineItems: lineItems)
                ),
                responseModel: UpdateDraftOrderDataClass.self
            ) { [weak self] res in
                switch res {
                case .success(let success):
                    FireBaseManager.shared.saveCustomerDiscountCodes(
                        customerDiscountCodes: CustomerDiscountCodes(
                            id: self?.customerDiscountCodes?.id,
                            discountCodes: self?.customerDiscountCodes?.discountCodes,
                            usedDiscountCodes: self?.customerDiscountCodes?.usedDiscountCodes,
                            draftOrders: DraftOrders(
                                favoriteDraftorder: DraftOrderDataClass(
                                    draftOrderCreate: DraftOrderCreate(
                                        draftOrder: success.draftOrderUpdate?.draftOrder
                                    )
                                ),
                                cartDraftOrder: self?.draftOrderDataClass
                            )
                        )
                    )
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    func indexSet(for item: LinesItemNode) -> IndexSet? {
        guard let products = products else {
            return nil
        }
        
        let index = products.firstIndex { $0.variant?.id == item.variant?.id }
        guard let unwrappedIndex = index else {
            return nil
        }
        
        return IndexSet(integer: unwrappedIndex)
    }
}
