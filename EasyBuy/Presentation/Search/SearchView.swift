//
//  SearchView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State private var searchText = ""

    var body: some View {
        ScrollView {
            VStack {
                SearchBar(text: $searchText)
                
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                    ForEach(viewModel.items?.filter {
                        searchText.isEmpty ? true : $0.title!.lowercased().contains(searchText.lowercased())
                    } ?? []) { product in
                        ProductCell(product: product)
                    }
                })
                .padding(15)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
