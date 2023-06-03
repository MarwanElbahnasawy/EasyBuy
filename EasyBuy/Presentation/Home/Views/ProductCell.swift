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
        .shadow(color: Color.init("dddddd"), radius: 0.5, x: 0.3, y: 0.3)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            KingFisherImageView(url: product.image?.src ?? "https://theperfectroundgolf.com/wp-content/uploads/2022/04/placeholder.png",placeholder: "")
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 2 - 20, height: UIScreen.main.bounds.width / 2 - 20)
                .scaledToFill()
                .cornerRadius(10)
//                .overlay(
//                    FevoriteButton()
//                        .padding([.top, .trailing], 5)
//                    , alignment: .topTrailing
//                )
            Text(product.title ?? "title")
                .font(Font.system(size: 15, weight: .regular, design: .rounded))
            Text(product.product_type ?? "product type")
                .font(.custom(Constants.AppFont.regularFont, size: 11))
                .foregroundColor(Color.gray)
                .padding([.horizontal], 5)
            let price = "$\(product.variants![0].price!)"
            Text(price)
                .font(Font.system(size: 15, weight: .heavy, design: .rounded))
        }
        .aspectRatio(contentMode: .fit)
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    
    static var product:Product = Product()
    
    static var previews: some View {
        ProductCell(product: product)
    }
}
