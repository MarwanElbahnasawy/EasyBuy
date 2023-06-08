//
//  QuantityView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI

struct QuantityView: View {
    var body: some View {
        HStack (spacing: 4) {
            Button(action: {}) {
                Image(systemName: "minus")
                    .padding(.all, 8)
                
            }
            .frame(width: 30, height: 30)
            .overlay(RoundedCorner(radius: 50).stroke())
            .foregroundColor(.black)
            
            Text("1")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
            
            Button(action: {}) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(.all, 8)
                    .background(Color.black)
                    .clipShape(Circle())
            }
        }
    }
}
