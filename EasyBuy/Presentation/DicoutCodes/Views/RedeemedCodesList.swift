//
//  RedeemedCodesList.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 05/06/2023.
//

import SwiftUI

struct RedeemedCodesList: View {
    @ObservedObject var redeemedViewModel: RedeemedListViewModel
    var body: some View {
        VStack(alignment: .leading){
            if #available(iOS 16.0, *) {
                Text("Redeemed Discounts Offer").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
                List(redeemedViewModel.codes?.discountCodes ?? []){code in
                    RedeemedCell(code: code, isUseable: false).listRowBackground(Color.clear)   .listRowSeparator(.hidden).clipped().cornerRadius(16)
                }
            }
            
        }.onAppear(){
            let customerID = UserDefaults.standard.string(forKey: "customerID")
            redeemedViewModel.getRedeemedCode(id: customerID!)
            
        }
    }
}

struct RedeemedCodesList_Previews: PreviewProvider {
    static var previews: some View {
        RedeemedCodesList(redeemedViewModel: RedeemedListViewModel())
    }
}
