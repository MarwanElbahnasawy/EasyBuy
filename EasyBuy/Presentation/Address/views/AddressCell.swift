//
//  AddressCell.swift
//  EasyBuy
//
//  Created by mo_fathy on 15/06/2023.
//

import SwiftUI

struct AddressCell: View {
    var address : CustomerAddress = CustomerAddress()
    var body: some View {
        VStack(alignment: .leading) {
            VStack{
                HStack {
                    Text("Address  : ")
                    Text(address.address1 ?? "Street").foregroundColor(.gray)
                    Spacer()
      
                }.padding([.top], 2)
                if let address = address.address2 {
                    if address != ""{
                        HStack {
                            
                            Text("Address 2 : ")
                            Text(address).foregroundColor(.gray)
                            Spacer()
                        }.padding([.top], 2)
                    }
                }
                HStack {
                    Text("City : ")
                    Text(address.city ?? "City").foregroundColor(.gray)
                    Spacer()
      
                }.padding([.top], 2)
                HStack {
                    Text("Country: ")
                    Text(address.country ?? "Country").foregroundColor(.gray)
                    Spacer()
      
                }.padding([.top], 2)
                HStack {
                    Text("Zip code : ")
                    Text(address.zip ?? "code").foregroundColor(.gray)
                    Spacer()
      
                }.padding([.top], 2)
                HStack {
                    Text("Phone number : ")
                    Text(address.phone ?? "number").foregroundColor(.gray)
                    Spacer()
      
                }.padding([.top], 2)
                
                
            }.padding(.all,20)
               .background(Color("itemcolor"))
                .cornerRadius(30)
        }
        .font(.footnote)
    }
}

struct AddressCell_Previews: PreviewProvider {
    static var previews: some View {
        AddressCell()
    }
}
