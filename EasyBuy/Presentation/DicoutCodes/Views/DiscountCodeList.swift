//
//  DiscountCodeList.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 04/06/2023.
//

import SwiftUI

struct DiscountCodesList: View {
    @StateObject var discountCodesViewModel = DiscountCodesListViewModel()
    @State var adType: AdType = .all
  
    var body: some View {
        VStack{
            if #available(iOS 16.0, *) {
                Text("Discounts Offer").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22)).onAppear(){
                    discountCodesViewModel.isLoading = true
                }
            }
            if discountCodesViewModel.isLoading{
                LottieView(lottieFile: "loading").onAppear{
                    discountCodesViewModel.getDiscountCodes(first: 10)
                }

            }
            else{
                if discountCodesViewModel.getDiscountCodesForListView(adType: adType)?.isEmpty == true{
                    NoProducts()
                }
                else{
                    ScrollView{
                        LazyVStack {
                            ForEach(discountCodesViewModel.getDiscountCodesForListView(adType: adType) ?? []){ discountCode in
                                DiscountCodeCell(discountCode: discountCode, cellViewModel: DiscountCodeViewModel(discountCode: discountCode ,adType: adType)).frame(height: UIScreen.main.bounds.height/4).padding(.all,20).listRowBackground(Color.clear)   .listRowSeparator(.hidden).clipped().cornerRadius(10)
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct DiscountCodeList_Previews: PreviewProvider {
    static var previews: some View {
        DiscountCodesList(discountCodesViewModel: DiscountCodesListViewModel(),adType: .men)
    }
}

