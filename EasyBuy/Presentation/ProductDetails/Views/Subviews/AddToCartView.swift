//
//  AddToCartView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI

struct AddToCartView: View {
    let price: String?
    let action: () -> Void
    var body: some View {
       HStack {
            VStack {
                Text("Total price")
                Text("$\(price ?? "")")
                    .font(.title)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Button(action: action) {
                Text("Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.black)
                    .cornerRadius(10.0)
            }
            
        }
        .padding()
        .padding(.horizontal)
        .cornerRadius(60.0, corners: .topLeft)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea(.bottom)
    }
}

