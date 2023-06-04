//
//  DiscountCodeList.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 04/06/2023.
//

import SwiftUI

struct DiscountCodesList: View {
    @StateObject var discountCodesViewModel = DiscountCodesListViewModel()
    var body: some View {
        VStack{
            if #available(iOS 16.0, *) {
                Text("Discounts Offer").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(.headline)
            }
            
            List(discountCodesViewModel.discountCodes?.codeDiscountNodes?.nodes ?? []){ discountCode in
                DiscountCodeCell(discountCode: discountCode).listRowBackground(Color.clear)   .listRowSeparator(.hidden).clipped().cornerRadius(10)

            }.onAppear {
                discountCodesViewModel.getDiscountCodes(first: 10)
            }
        }
    }
}

struct DiscountCodeList_Previews: PreviewProvider {
    static var previews: some View {
        DiscountCodesList()
    }
}

