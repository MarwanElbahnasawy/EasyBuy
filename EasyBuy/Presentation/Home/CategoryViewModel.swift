//
//  CategoryViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 04/06/2023.
//

import Foundation


class CategoryViewModel: ObservableObject {
    @Published var items: [Product]?
    @Published var isLoading: Bool = false
    @Published  var filterBy: String = "All"
    @Published  var activeTag: String = "All"
    @Published var arrFilter: [String] = []
    @Published var products :[Product] = []
    @Published var tags: [String] = []
    init(){
        fetchProducts()
    }
    
    
    func fetchProducts(){
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query:GetAllProductsQuery(first: 100,imageFirst: 5, variantsFirst: 5) , responseModel: DataClassProdcuts.self, completion: { result in
                            switch result {
                            case .success(let success):
                                DispatchQueue.main.async {
                                    self.items = success.products?.nodes
                                    self.isLoading = false
                                    self.onAppearView()
                                }
                            case .failure(let failure):
                                print(failure)
                            }
                        })
    }
    
    
    func onAppearView(){
        products = items ?? []
          tags = ["All"]
        getTags(products: items ?? []).forEach({ tag in
              tags.append(tag)
          })
          arrFilter = ["All"]
        getType(products: items ?? []).forEach({ tag in
              arrFilter.append(tag)
          })
    }
    
    func filterTag(){
        if(self.filterBy == "All"){
            products =  items ?? []
            if(activeTag == "All"){
                products =  items ?? []
            }else{
                products =  items?.filter { Product in
                    if Product.tags!.contains(activeTag) {
                        return true
                    } else {
                        return false
                    }
                } ?? []
            }
        }else{
            if(activeTag == "All"){
                products =  items ?? []
            }else{
                products =  items?.filter { Product in
                    if Product.tags!.contains(activeTag) {
                        return true
                    } else {
                        return false
                    }
                } ?? []
            }
            products =  products.filter { Product in
                if Product.productType!.contains(filterBy) {
                    return true
                } else {
                    return false
                }
            }
        }
    }
    
    func filter(){
        if(activeTag == "All"){
            products =  items ?? []
            if(self.filterBy == "All"){}else{
                products =  products.filter { Product in
                    if Product.productType!.contains(self.filterBy) {
                        return true
                    } else {
                        return false
                    }
                }
            }
        }else{
            products =  items?.filter { Product in
                if Product.tags!.contains(activeTag) {
                    return true
                } else {
                    return false
                }
            } ?? []
            if(self.filterBy == "All"){}else{
                products =  products.filter { Product in
                    if Product.productType!.contains(self.filterBy) {
                        return true
                    } else {
                        return false
                    }
                }
            }
        }
    }
    }
    

