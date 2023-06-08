//
//  RatingView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    
    var body: some View {
        HStack (spacing: 4) {
            ForEach(0 ..< 5) { item in
                Image("star")
            }
            
            Text("(\(rating))")
                .opacity(0.5)
                .padding(.leading, 8)
            
            Spacer()
        }
    }
}
