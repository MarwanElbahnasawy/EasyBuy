//
//  CodesView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 05/06/2023.
//

import SwiftUI

struct CodesView: View {
    @State var selectedValue = 0
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Picker(selection: $selectedValue, label: Text("someText")){
                    Text("Discount Codes").tag(0)
                    Text("Redeemed Codes").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
            }.padding()
            VStack{
                if selectedValue == 0 {
                    DiscountCodesList()
                }
                else{
                   RedeemedCodesList(redeemedViewModel: RedeemedListViewModel())
                }
            }
        }
    }
    }


struct CodesView_Previews: PreviewProvider {
    static var previews: some View {
        CodesView()
    }
}
