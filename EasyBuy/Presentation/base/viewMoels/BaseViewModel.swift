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
    

}

// MARK: - TAB ITEM CASE
enum Tab: String {
    case Home = "home"
    case Category = "category"
    case Heart = "heart"
    case Person = "person"
}
