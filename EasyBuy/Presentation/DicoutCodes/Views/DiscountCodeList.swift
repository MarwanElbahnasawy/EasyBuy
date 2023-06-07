//
//  DiscountCodeList.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 04/06/2023.
//

import SwiftUI

struct DiscountCodesList: View {
    @ObservedObject var discountCodesViewModel: DiscountCodesListViewModel
    @State var adType: AdType = .all
  
    var body: some View {
        VStack{
            if #available(iOS 16.0, *) {
                Text("Discounts Offer").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
            }
            
            List(discountCodesViewModel.getDiscountCodesForListView(adType: adType) ?? []){ discountCode in
                DiscountCodeCell(discountCode: discountCode, cellViewModel: DiscountCodeViewModel(discountCode: discountCode ,adType: adType)).listRowBackground(Color.clear)   .listRowSeparator(.hidden).clipped().cornerRadius(10)

            }.onAppear {
                discountCodesViewModel.getDiscountCodes(first: 20)
            }
        }
    }
}

struct DiscountCodeList_Previews: PreviewProvider {
    static var previews: some View {
        DiscountCodesList(discountCodesViewModel: DiscountCodesListViewModel(),adType: .men)
    }
}

