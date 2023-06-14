//
//  ProductTitleView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI

struct ProductTitleView: View {
    let title: String
    let productType: String
    let action: () -> Void

    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(productType)
            }
            
            Spacer()
            
            Button(action: action) {
                Image(systemName: "heart")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
            }
        }
    }
}

