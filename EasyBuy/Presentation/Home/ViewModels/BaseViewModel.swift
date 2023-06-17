//
//  BaseViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 03/06/2023.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    // MARK: - TAB BAR
    @Published var currentTab: Tab = .Home
    
    @Published var homeTab = "Facewash"
    
    // MARK: - DETAIL VIEW
   // @Published var currentProduct: Product?
    @Published var showDetail = false
    @Published var count: Int = 0
    
    func getCountCartView(){
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument(completion: {[weak self] snapshot, error in
            
            if let error = error {
                print("Failed to fetch current user:", error)
                return
            }
            guard let data = snapshot?.data() else {
                print("no data found")
                self?.count = 0
                return
            }
            
            let objFireBase = FireBaseManager.shared.mapFireBaseObject(data: data)
            self?.count = objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.lineItems?.nodes?.count ?? 0
            print(self?.count ?? 0)

        })
    }
}

// MARK: - TAB ITEM CASE
enum Tab: String {
    case Home = "home"
    case Category = "category"
    case Heart = "heart"
    case Person = "person"
}
