//
//  CartCellViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 13/06/2023.
//

import Foundation

class CartListViewModel: ObservableObject{
    @Published var products: [LinesItemNode]?
    @Published var draftOrderID: String?
    @Published var customerDiscountCodes: CustomerDiscountCodes?
    var draftOrderDataClass: DraftOrderDataClass?
    @Published var totalPrice: String = ""
    func getCartItems(){
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument(completion: {[weak self] snapshot, error in
            
            if let error = error {
                print("Failed to fetch current user:", error)
                return
            }
            guard let data = snapshot?.data() else {
                print("no data found")
                self?.products = []
                return
            }
            
            let objFireBase = FireBaseManager.shared.mapFireBaseObject(data: data)
            self?.draftOrderID = objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id ?? ""
            self?.customerDiscountCodes = objFireBase ?? CustomerDiscountCodes()
            self?.getDraftOrders(id: self?.draftOrderID ?? "")
            self?.draftOrderDataClass = objFireBase?.draftOrders?.favoriteDraftorder
        })
    }
    
    private func getDraftOrders(id: String){
        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query: DraftOrderQuery(id: id), responseModel: DraftOrderCreate.self) { [weak self] res in
            switch res {
            case .success(let success):
                self?.products = success.draftOrder?.lineItems?.nodes
                UserDefaults.standard.set(self?.products?.count, forKey: "count")
                self?.totalPrice = success.draftOrder?.totalPrice ?? ""
            case .failure(let failure):
                print(failure)
                self?.products = []
            }
        }
    }
    func deletProduct(indexSet: IndexSet){
        products?.remove(atOffsets: indexSet)
        let lineItems = mapLineItemsToDratOrderLineItems(lineItems: products)
        if lineItems.isEmpty{
            UserDefaults.standard.set(0, forKey: "count")
            NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderDeleteMutation(input: DraftOrderDeleteInput(id: draftOrderID ?? "")), responseModel: DeleteDraftOrderDataClass.self) { res in
                switch res{
                case .success(let success):
                    print(success)
                    FireBaseManager.shared.removeCartFromFireBase()
                case .failure(let failure):
                    print(failure)
                }
            }
        }
        else{
            NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderUpdateMutation(id: draftOrderID ?? " ", input: DraftOrderInput(lineItems: lineItems)), responseModel: UpdateDraftOrderDataClass.self) {[weak self] res in
                switch res {
                case .success(let success):
                    self?.totalPrice = success.draftOrderUpdate?.draftOrder?.totalPrice ?? ""
                    UserDefaults.standard.set(success.draftOrderUpdate?.draftOrder?.lineItems?.nodes?.count, forKey: "count")
                    FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: self?.customerDiscountCodes?.id,
                                                                                                                  discountCodes: self?.customerDiscountCodes?.discountCodes
                                                                                                                  ,                                draftOrders: DraftOrders(favoriteDraftorder: self?.draftOrderDataClass, cartDraftOrder: DraftOrderDataClass(draftOrderCreate: DraftOrderCreate(draftOrder: success.draftOrderUpdate?.draftOrder)))))
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

