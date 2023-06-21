//
//  PaymentButton.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 16/06/2023.
//

import Foundation
import SwiftUI

struct PaymentButton: UIViewRepresentable {
    var products: [LinesItemNode]
    var totalPrice: String
    var currrencyCode: String
    var draftOrderID: String
 
    func makeCoordinator () -> PaymentManager {
      PaymentManager(items: products, totalPrice: totalPrice , currencyCode: currrencyCode,draftOrderId: draftOrderID)
    }
    func makeUIView(context: Context) -> some UIView {
        context.coordinator.button
    }
    func updateUIView(_ uiview: UIViewType, context: Context) {
        context.coordinator.items = products
    }
}
