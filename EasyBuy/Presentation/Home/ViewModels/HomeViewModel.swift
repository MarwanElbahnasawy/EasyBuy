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
//        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query:GetProductsQuery(first: 3) , responseModel: Root.self, completion: { result in
//                            switch result {
//                            case .success(let success):
//                                print("product name : \(success.products?.edges?[0].node?.title ?? "storefront")")
//                            case .failure(let failure):
//                                print(failure)
//                            }
//                        })
    }
    func fetchProducts(){
        items = Bundle.main.decode("products.json")
    }
}
