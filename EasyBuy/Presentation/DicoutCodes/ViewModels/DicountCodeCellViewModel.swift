//
//  DicountCodeCellViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 04/06/2023.
//

import Foundation

class DiscountCodeViewModel : ObservableObject{
    var discountCode: CodeDiscountNodesNode?
    var title: String
    var summury: String
    var code: String
    init(discountCode: CodeDiscountNodesNode?) {
        self.discountCode = discountCode
        self.title = discountCode?.codeDiscount?.title ?? ""
        self.summury = discountCode?.codeDiscount?.summary ?? ""
        self.code = "with code : \(discountCode?.codeDiscount?.codes?.nodes?.first?.code ?? "")"
    }
    
    func getImageName() -> String {
        var image = ""
        if ((discountCode?.codeDiscount?.title!.contains("Shoes")) != nil){
             image = "Shoes"
        }
        if ((discountCode?.codeDiscount?.title!.contains("Bags")) != nil){
             image = "Bags"
        }
        if ((discountCode?.codeDiscount?.title!.contains("Watches")) != nil){
             image = "Watches"
        }
        if ((discountCode?.codeDiscount?.title!.contains("Everything")) != nil){
             image = "Everything"
        }
        return image
    }
    func saveCodeForCustomer(){
        // save on fire store for costumer 1 to his discount codes
        print("pressed")
    }
}
