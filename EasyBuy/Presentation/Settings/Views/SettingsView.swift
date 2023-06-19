//
//  SettingsView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 16/06/2023.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel = SettingsViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var selectedCode: String = "USD"
    @State private var isMenuOpen = false
    @State private var showAlert = false
    @State private var isBack = false
    @State private var isSave = false
    var body: some View {
        VStack{
            if #available(iOS 16.0, *) {
                Text("Settings").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).padding(.top,10).fontWeight(.heavy).font(Font.system(size: 22))
            }
            
            if #available(iOS 16.0, *) {
                Text("Address").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).padding(.top,10).fontWeight(.bold).font(Font.system(size: 22))
            }
            AddressCell(address: viewModel.customerAddress ?? CustomerAddress())
                .padding(.horizontal,10).padding(.top,10).onAppear{
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
            HStack(alignment: .center){
                Text("Currency Code : ").fontWeight(.semibold)
                Spacer()
                Menu {
                    ForEach(viewModel.currencyCodes , id: \.self) { code in
                        Button {
                            selectedCode = code
                            viewModel.getCurrency(base: code)
                        } label: {
                            Text(code)
                        }
                    }
                } label: {
                    Label(selectedCode, systemImage: "arrowtriangle.down.fill")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .background(Color.black)
                        .lineLimit(0)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }.onAppear{
                    selectedCode = UserDefaults.standard.currency ?? "USD"
                    viewModel.getCurrency()
                }
                Spacer()
            }.padding(.all,10)
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.white)
                .cornerRadius(30)
            Spacer()
            Button {
                isSave = true
                showAlert = true
            } label: {
                Text("Save")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            } .alert(isPresented: $showAlert) {
                var alert: Alert
                if isSave{
                   alert = Alert(title: Text("Save!"), message: Text("All changes will be applied"), primaryButton: .default(Text("OK")) {
                       viewModel.saveCurrencyCode(code: selectedCode)
                       print("selected code is \(selectedCode)")
                        viewModel.saveAddress()
                       print("in settings \(viewModel.selectedCodeValue)")
                       presentationMode.wrappedValue.dismiss()
                    }, secondaryButton: .cancel(Text("Cancel")) {
                        print("Cancel button tapped")
                    })
                }
                else{
                   alert = Alert(title: Text("Warning"), message: Text("Data will not be saved"), dismissButton: .default(Text("OK")) {
                       presentationMode.wrappedValue.dismiss()
                       print("OK button tapped")
                   })
                }
                return alert
            }
            
            
        }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(action: {
                isBack = true
                showAlert = true
            })).background(Color("itemcolor"))
    }
    }
     


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
