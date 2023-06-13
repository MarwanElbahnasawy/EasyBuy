//
//  ShopingCartListUIView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 13/06/2023.
//

import SwiftUI

struct ShopingCartListUIView: View {
    @ObservedObject var shopingCartViewModel: CartListViewModel
    
    var body: some View {
  
        List(shopingCartViewModel.products ?? [],id: \.product?.id){item in
                FavoriteAndCartCell(imageUrl: URL(string: item.product?.featuredImage?.url ?? "not available"),title: item.product?.title ,
                                    type: item.product?.productType,
                                    price:
                                        item.product?.priceRangeV2?.maxVariantPrice?.amount)
            }.onAppear{
                shopingCartViewModel.getCartItems()
            }
         
      
    }
}

struct ShopingCartListUIView_Previews: PreviewProvider {
    static var previews: some View {
        ShopingCartListUIView(shopingCartViewModel: CartListViewModel())
    }
}

