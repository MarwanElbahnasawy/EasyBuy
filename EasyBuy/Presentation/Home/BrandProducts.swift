//
//  BrandProducts.swift
//  final test
//
//  Created by mo_fathy on 02/06/2023.
//

import SwiftUI

struct BrandProducts: View {
    var id : String
    var brand : String
    var body: some View {
        @State var items: ResProducts = Bundle.main.decode("products.json")
        NavigationView{
            ZStack {
                VStack(spacing: 0) {
                    HStack{
                        let brand = "\(brand) PRODUCTS"
                        TitleView(title: brand)
                            .font(.custom(Constants.AppFont.boldFont, size: 18))
                    }
                    ProductCatalog(products:items.products)
                }
            }//ZStack
       
        }
    }
}

struct BrandProducts_Previews: PreviewProvider {
    static var previews: some View {
        BrandProducts(id: "1", brand: "ADIDAS")
    }
}
