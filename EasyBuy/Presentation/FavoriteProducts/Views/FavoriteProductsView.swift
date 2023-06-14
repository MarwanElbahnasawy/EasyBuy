//
//  FavoriteProductsView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 14/06/2023.
//

import SwiftUI

struct FavoriteProductsView: View {
    
    @ObservedObject var favoriteProductViewModel: FavoriteListViewModel
    @State private var showAlert = false
    @State private var indexSet: IndexSet?
    
    var body: some View {
        List {
            ForEach(favoriteProductViewModel.products ?? [], id: \.variant?.id) { item in
                FavoriteAndCartCell(
                    imageUrl: URL(string: item.product?.featuredImage?.url ?? "not available"),
                    title: item.product?.title,
                    type: item.product?.productType,
                    price: item.product?.priceRangeV2?.maxVariantPrice?.amount
                )
                
            }.onDelete { indexSet in
                showAlert = true
                self.indexSet = indexSet
            }.alert(isPresented: $showAlert){
                Alert(title: Text("Delete ?"),message: Text("Do you want to delete this product from your favorite ?") ,
                      primaryButton: .destructive(Text("OK"),action: {
                    favoriteProductViewModel.deleteFavoriteProduct(indexSet: self.indexSet ?? IndexSet())
                }),
                      secondaryButton: .cancel())
            }
        }
        .onAppear{
            favoriteProductViewModel.getFavoriteProducts()
        }
    }
}
