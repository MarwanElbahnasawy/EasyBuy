//
//  SettingsView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 16/06/2023.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel = SettingsViewModel()
    var body: some View {
        if #available(iOS 16.0, *) {
            Text("Settings").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
        }
        AddressCell(address: viewModel.customerAddress ?? CustomerAddress())
            .padding(.leading,10).padding(.top,10).onAppear{
                viewModel.getAddress()
            }

            NavigationLink(destination: {
                AddressView(settingsViewModel: viewModel,isComingFromSettings: true)
            }, label: {
                Text("Address")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            })
        if #available(iOS 16.0, *) {
            Text("Currency Code").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
        }
        
        Button {
            viewModel.saveAddress()
        } label: {
            Text("Save")
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(5)
        }

  
    }
   
    }
     


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
