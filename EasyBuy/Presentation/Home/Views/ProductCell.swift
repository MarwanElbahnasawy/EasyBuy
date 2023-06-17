//
//  ProductCell.swift
//  EasyBuy
//
//  Created by mo_fathy on 03/06/2023.
//

import SwiftUI

struct ProductCell: View {
    var product:Product
    var isFavorite : Bool = false
    fileprivate func FevoriteButton() -> some View {
        return Button(action: {
            print("Name: \(self.product.title ?? "title")")
        }) {
            Image(systemName: isFavorite == true ? "heart.fill" : "heart")
                .foregroundColor(isFavorite == true ? .red :.gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
        }
        .cornerRadius(20)
        .opacity(0.9)
        .shadow(color: Color.gray, radius: 0.5, x: 0.3, y: 0.3)
    }
    
    var body: some View {
        NavigationLink(destination:
                        ProductDetailsView(viewModel: ProductViewModel(productId: nil), productId: product.id!)){
            VStack(alignment: .leading, spacing: 4) {
                images(product: product)
                    .frame(width: UIScreen.main.bounds.width / 2 - 20, height: UIScreen.main.bounds.width / 2 - 20)
                    .cornerRadius(10)
                HStack{

                    if let title = product.title {
                    let parts = title.split (separator: "|")
                    if parts.count > 1 {
                        Text (parts [1])
                        .font (.system(size: 16,design: .rounded))
                        .foregroundColor(Color("myblack"))
                    } else {
                        Text (title)
                            . font (.system(size: 16))
                    }
                    } else {
                        Text ( "Unknown" )
                            . font (.system(size: 16))
                    }
      

                    Spacer()
                }.frame(width:  UIScreen.main.bounds.width / 2 - 20,height: 25)
                Text(product.productType ?? "product type")
                    .font(.custom(Constants.AppFont.regularFont, size: 11))
                    .foregroundColor(Color.gray)
                    .padding([.horizontal], 5)
                let price : Double = Double( product.variants?.edges?.first?.node?.price?.amount ?? "0.0") ?? 0.0
                let priceCurrency = price * (UserDefaults.standard.numCurrency ?? 1.0)
                let formattedprice = String(format: "%.2f", priceCurrency) + " \(UserDefaults.standard.currency!)"
                Text(formattedprice)
                    .font(Font.system(size: 15, weight: .heavy, design: .rounded))
                    .foregroundColor(Color("myblack"))
            }
            .aspectRatio(contentMode: .fit)
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    
    static var product = Product()
    
    static var previews: some View {
        ProductCell(product: product)
    }
}
