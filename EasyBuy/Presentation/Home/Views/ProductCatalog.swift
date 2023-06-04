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
                                NavigationLink(destination:Home()
//                                    ProductDetail(product: prod)
                                        .padding(.horizontal, 16)

                                ) {
                                   ProductCell(product: prod)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    
                    if prods.count == 2 {
                        VStack(alignment: .center, spacing: 8) {
                            ForEach(prods[1], id: \.id) { prod in
                                NavigationLink(destination:
                                                Home()
                                //    ProductDetail(product: prod)
                                        .padding(.horizontal, 16)
                                ) {
                                   ProductCell(product: prod)
                               }
                              .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    
                    if prods.count == 0 {

                        VStack(alignment: .center, spacing: 4) {
                            Spacer()
                            Image(systemName: "bag.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.gray)
                                .frame(width: 40, height: 40, alignment: .center)
                                .padding(.bottom, 20)
                            Text("No Products To Display")
                                .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                    }
                    
                }
                .padding()
            }
           
            .navigationBarTitle("Catalog", displayMode: .inline)
            .navigationBarHidden(true)
        }
        
        
        
    }


struct ProductCatalog_Previews: PreviewProvider {
 
    static var previews: some View {
      
        ProductCatalog()
    }
}
