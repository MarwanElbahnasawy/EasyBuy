//
//  SearchBar.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            
            Button(action: {
                self.text = ""
            }) {
                Text("Clear")
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
}

