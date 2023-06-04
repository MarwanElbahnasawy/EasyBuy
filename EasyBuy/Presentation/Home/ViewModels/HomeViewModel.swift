//
//  HomeViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 03/06/2023.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var brands: SmartCollections?
    @Published var items: [Product]?
    @Published var isLoading: Bool = false
    init(){
     
    }
    
    func fetchBrands(){
        brands =  Bundle.main.decode("brand.json")
       
    
    }
    func fetchProducts(){
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query:ProductsQuery(first: 100,imageFirst: 5, variantsFirst: 5) , responseModel: DataClassProdcuts.self, completion: { result in
                            switch result {
                            case .success(let success):
                                self.items = success.products?.nodes
                                self.isLoading = false
                            case .failure(let failure):
                                print(failure)
                            }
                        })
    }
}
