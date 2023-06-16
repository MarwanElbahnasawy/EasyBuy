//
//  AddressCartView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 15/06/2023.
//

import SwiftUI

struct AddressCartView: View {
     let street: String
       let city: String
       let state: String
       let phone: String
       let zipcode: String
       let country: String
       
       var body: some View {
           VStack(alignment: .leading) {
               HStack{
                   Text("Street:").fontWeight(.semibold)
                   Text("\(street)").fontWeight(.thin)
                   Spacer()
               }.padding(.leading,10)
               HStack{
                   Text("City:").fontWeight(.semibold)
                   Text("\(city)").fontWeight(.thin)
                   Spacer()
               }.padding(.leading,10)
               HStack{
                   Text("State:").fontWeight(.semibold)
                   Text("\(state)").fontWeight(.thin)
                   Spacer()
               }.padding(.leading,10)
               HStack{
                   Text("Country:").fontWeight(.semibold)
                   Text("\(country)").fontWeight(.thin)
                   Spacer()
               }.padding(.leading,10)
               HStack{
                   Text("Phone:").fontWeight(.semibold)
                   Text("\(phone)").fontWeight(.thin)
                   Spacer()
               }.padding(.leading,10)
             
           }
       }
}

struct AddressCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddressCartView(street: "ismailia", city: "ismailia", state: "ismailia", phone: "ismailia", zipcode: "ismailia", country: "ismailia")
    }
}
