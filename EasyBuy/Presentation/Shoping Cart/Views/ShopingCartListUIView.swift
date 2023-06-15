//
//  ShopingCartListUIView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 13/06/2023.
//

import SwiftUI

struct ShopingCartListUIView: View {
    @ObservedObject var shopingCartViewModel: CartListViewModel
    @State private var showAlert = false
    @State private var indexSet: IndexSet?
    var body: some View {
  
        List {
            ForEach(shopingCartViewModel.products ?? [], id: \.variant?.id) { item in
                FavoriteAndCartCell(imageUrl: URL(string: item.product?.featuredImage?.url ?? "not available"), title: item.product?.title,
                                    type: item.product?.productType,
                                    price: item.product?.priceRangeV2?.maxVariantPrice?.amount)
              
            }.onDelete { indexSet in
                showAlert = true
                self.indexSet = indexSet
            }.alert(isPresented: $showAlert){
                Alert(title: Text("Delete ?"),message: Text("Do you want to delete this product from your cart ?") ,
                      primaryButton: .destructive(Text("OK"),action: {
                    shopingCartViewModel.deletProduct(indexSet: self.indexSet ?? IndexSet())
                }),
                      secondaryButton: .cancel())
            }
            }
        .onAppear{
            shopingCartViewModel.getCartItems()
        }
         
      
    }
}
