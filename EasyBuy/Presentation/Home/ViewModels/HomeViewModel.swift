//
//  HomeViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 03/06/2023.
//

import Apollo
import Alamofire
import Foundation

class HomeViewModel: ObservableObject {
    @Published var brands: [Brand]?
    @Published var items: [Product]?
    @Published var iserror: Bool = false
    @Published var isLoading: Bool = true
    var rates: [String: Double]?
    
    init(){
        getCurrency()
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
                                self.iserror = true
                            }
                        })
    }
    
    func getCurrency(base :String = "USD"){
        let param : [String: String] = ["base": base]
        APIServices.instance.getDataAll(route: .typy, method: .get, params: param, encoding: URLEncoding.default, headers: nil) { [weak self] (dataurl: Root?, error) in
            self?.rates = dataurl?.rates
            dataurl?.rates.forEach({ (key: String, value: Double) in
                if(key == UserDefaults.standard.currency){
                    print(key)
                    print(value)
                    UserDefaults.standard.numCurrency = value
                }
            })
        }
    }
    
    
}
