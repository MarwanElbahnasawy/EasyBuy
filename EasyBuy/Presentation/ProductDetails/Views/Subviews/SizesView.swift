//
//  SizesView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI

struct SizesView: View {
    let sizes: [String]?
    
    var body: some View {
        if let sizes = sizes {
            Text("Sizes")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            HStack {
                ForEach(sizes, id: \.self) { sizeOption in
                    Text(sizeOption)
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
            }
        }
    }
}
