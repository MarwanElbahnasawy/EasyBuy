//
//  BackButtonView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.white)
                .padding(.all, 12)
                .background(Color.black)
                .cornerRadius(8.0)
        }
    }
}
