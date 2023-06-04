//
//  SwiftUIView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 03/06/2023.
//

import SwiftUI
import Apollo

struct SwiftUIView: View {
    let viewModel = ProductViewModel(productId: nil)
    let productId = "gid://shopify/Product/8311139107123"
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                NavigationLink(destination:
                                ProductDetailsView(viewModel: viewModel, productId: productId)) {
                    Text("Go to Detail Screen")
                }
            }
            .padding()
            .navigationTitle("Main Screen")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
