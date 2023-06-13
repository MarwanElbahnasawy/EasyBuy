//
//  BrandViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 04/06/2023.
//

import Foundation
class BrandViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var items: [Product]?
    @Published var lottieFile = "loading"
    var id : String?
    var brand : String?
 
    init( id: String? = nil, brand: String? = nil) {
        self.id = id
        self.brand = brand
    }
    init(){
        
    }
    
    func fetchBrand(){
        
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query:CollectionProductsQuery(handle: id,first: 100, imageFirst: 5,variantsFirst: 5), responseModel: ResCollectionHandle.self, completion: { result in
                            switch result {
                            case .success(let success):
                                self.items = success.collection?.products?.nodes
                                self.isLoading = false
                            case .failure(let failure):
                                print(failure)
                            }
                        })
    }
}
