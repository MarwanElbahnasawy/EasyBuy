//
//  HomeViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 03/06/2023.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var brands: SmartCollections?
    @Published var items: ResProducts?
    @Published var isLoading: Bool = true
    init(){
        fetchBrands()
        fetchProducts()
    }
    
    func fetchBrands(){
        brands =  Bundle.main.decode("brand.json")
        isLoading = false
    }
    func fetchProducts(){
        items = Bundle.main.decode("products.json")
    }
}
