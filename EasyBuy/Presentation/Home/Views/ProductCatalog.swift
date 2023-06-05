//
//  ProductCatalog.swift
//  EasyBuy
//
//  Created by mo_fathy on 02/06/2023.
//
import SwiftUI

struct ProductCatalog: View {
    
    var products:[Product] = []
    
    var body: some View {
        
        var prods: [[Product]] = []
        _ = (products).publisher
            .collect(products.count % 2 == 1 ? (products.count / 2) + 1 : (products.count / 2))
            .collect()
            .sink(receiveValue: { prods = $0 })
        
        return  ScrollView(.vertical, showsIndicators: true) {
            HStack(alignment: .top, spacing: 10) {
                if prods.count > 0 {
                    VStack(alignment: .center, spacing: 8) {
                        ForEach(prods[0], id: \.id) { prod in
                            ProductCell(product: prod)
                        }
                    }
                }
                if prods.count == 2 {
                    VStack(alignment: .center, spacing: 8) {
                        ForEach(prods[1], id: \.id) { prod in
                            ProductCell(product: prod)
                        }
                    }
                }
                if prods.count == 0 {
                    NoProducts()
                }
            }
            .padding()
        }
        // .navigationBarTitle("Catalog", displayMode: .inline)
        // .navigationBarHidden(true)
    }
}


struct ProductCatalog_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ProductCatalog()
    }
}
