//
//  HomeViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 03/06/2023.
//

import Foundation
import Apollo
class HomeViewModel: ObservableObject {
    @Published var brands: [Brand]?
    @Published var items: [Product]?
    @Published var lottieFile = "loading"
    @Published var isLoading: Bool = true
    init(){
        fetchBrands()
        fetchProducts()
    }
    
    func fetchBrands(){
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query:CollectionsQuery(first: 100) , responseModel: Res_Collection.self, completion: { result in
                            switch result {
                            case .success(let success):
                                self.brands = success.collections?.nodes
                            case .failure(let failure):
                                print(failure)
                            }
                        })
    }
    
    func fetchProducts(){
//        let draftOrderInput = DraftOrderInput(email: "marwan@gmail.com",
//            lineItems: [
//                DraftOrderLineItemInput(quantity: 1, variantId: "gid://shopify/ProductVariant/1234567890"),
//            ])
//        
//
//        let createDraftOrderMutation = DraftOrderNewCreateMutation(input: draftOrderInput)
//        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: createDraftOrderMutation, responseModel: OrderDataClass.self, completion: {
//            result in
//            switch result {
//            case .success(let success):
//                print(success)
//            case .failure(let failure):
//                print(failure)
//            }
//        })
//    
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query:GetAllProductsQuery(first: 100,imageFirst: 5, variantsFirst: 5) , responseModel: DataClassProdcuts.self, completion: { [weak self] result in
            guard let self = self else { return }
                            switch result {
                            case .success(let success):
                                DispatchQueue.main.async {
                                    self.items = success.products?.nodes
                                    self.isLoading = false
                                }
                            case .failure(let failure):
                                print(failure)
                                self.lottieFile = "error"
                            }
                        })
    }
}
