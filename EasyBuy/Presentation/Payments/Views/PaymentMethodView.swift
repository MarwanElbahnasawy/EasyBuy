//
//  PaymentMethodView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 16/06/2023.
//

import SwiftUI

struct PaymentMethodView: View {
    @Binding var totalPrice: String
    @State var products: [LinesItemNode] = []
    var body: some View {
        PaymentButton(products: products, totalPrice: totalPrice,currrencyCode: "USD").frame(minWidth: 100, maxWidth:
                .infinity, maxHeight: 45)
        .padding ()
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    @State static var totalPrice = "total price"
    @State static var products: [LinesItemNode] = []
    static var previews: some View {
        PaymentMethodView(totalPrice: $totalPrice)
    }
}
