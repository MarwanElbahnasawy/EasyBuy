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
    @Published var draftOrderDataClass: DraftOrderDataClass?
    @Published var totalPrice: String = ""
    @Published var quantity: Int = 1
    @Published var isLoading = true
    func getCartItems(){
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
            if let id = objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id {
                self?.draftOrderID = id
            }
            else{
                self?.isLoading = false
            }
            
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
                self?.totalPrice = success.draftOrder?.lineItemsSubtotalPrice?.presentmentMoney?.amount ?? ""
                print("total price is \(self?.totalPrice)")
                self?.isLoading = false
            case .failure(let failure):
                print(failure)
                self?.products = []
                self?.isLoading = false
            }
        }
    }
    func deletProduct(indexSet: IndexSet) {
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

                        self?.totalPrice = success.draftOrderUpdate?.draftOrder?.lineItemsSubtotalPrice?.presentmentMoney?.amount ?? ""

                    UserDefaults.standard.set(success.draftOrderUpdate?.draftOrder?.lineItems?.nodes?.count, forKey: "count")
                    FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: self?.customerDiscountCodes?.id,
                                                                                                                  discountCodes: self?.customerDiscountCodes?.discountCodes
                                                                                                                  , usedDiscountCodes: self?.customerDiscountCodes?.usedDiscountCodes                               ,                   draftOrders: DraftOrders(favoriteDraftorder: self?.draftOrderDataClass, cartDraftOrder: DraftOrderDataClass(draftOrderCreate: DraftOrderCreate(draftOrder: success.draftOrderUpdate?.draftOrder)))))
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
  
    func getItemSize(item: String?) -> String{
        var size = "1"
        if let sizeString = item?.split(separator: "/").first{
            size = String(sizeString)
        }
        else{
            size = "1"
        }
        print("size in cell is \(size)")
        return size
    }

}

