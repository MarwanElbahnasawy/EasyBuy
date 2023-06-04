//
//  BrandViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 04/06/2023.
//

import Foundation
class BrandViewModel: ObservableObject {
    @Published var isLoading: Bool = true
   // @Published var items: ResProducts?
    var id : String?
    var brand : String?
 
    
    func fetchBrand(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.isLoading = false
        //    self.items = Bundle.main.decode("products.json")
        }
     
        
    }
}
