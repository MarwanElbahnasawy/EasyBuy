//
//  SearchView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = HomeViewModel()
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Spacer()
                SearchBar(text: $searchText, isEditing: $isSearching)
                Spacer()
                
                if viewModel.items?.isEmpty == false {
                    LazyVGrid(columns: gridLayout, spacing: 15) {
                        ForEach(viewModel.items?.filter {
                            searchText.isEmpty ? true : $0.title!.lowercased().contains(searchText.lowercased())
                        } ?? []) { product in
                            ProductCell(product: product)
                        }
                    }
                    .padding(.horizontal, 15)
                    .animation(.default)
                    .transition(.opacity)
                } else {
                    Text("No results found")
                        .foregroundColor(.gray)
                        .padding()
                        .animation(.default)
                        .transition(.opacity)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
