//
//  CartCellViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 13/06/2023.
//

import Foundation

class CartListViewModel: ObservableObject{
    @Published var products: [LinesItemNode]?
    
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
            self?.getDraftOrders(id: objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id ?? "")
            
        })
    }
    
    private func getDraftOrders(id: String){
        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query: DraftOrderQuery(id: id), responseModel: DraftOrderCreate.self) { [weak self] res in
            switch res {
            case .success(let success):
                self?.products = success.draftOrder?.lineItems?.nodes
            case .failure(let failure):
                print(failure)
                self?.products = []
            }
        }
    }
}
