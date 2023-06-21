//
//  AddressView.swift
//  EasyBuy
//
//  Created by mo_fathy on 15/06/2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var viewModel = AddressViewModel()
    @State var id : String = ""
    @State var showAlert = false
    @State var checkOutViewMode: CheckoutViewModel = CheckoutViewModel()
    @State var settingsViewModel: SettingsViewModel = SettingsViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var isComingFromPayment = false
    @State var isComingFromSettings = false
    fileprivate  func deleteButton(id :String) -> some View {
        return Button(action: {
              print(id)
            self.id = id
            showAlert = true
        }) {
            Image(systemName: "x.circle")
                .foregroundColor( .red)
                .frame(width: 30, height: 30)
        }
        .cornerRadius(20)
        .opacity(0.9)
        .shadow(color: Color.gray, radius: 0.5, x: 0.3, y: 0.3)
    }

    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color("secColorBackground"))
            }
            .padding(.leading, 10)
            .frame(width: 50, height: 50)
            Spacer()
            
            NavigationLink(destination: AddressPage()) {
                Image(systemName: "plus")
                    .foregroundColor(Color("secColorBackground"))
                    .padding(.trailing,20)
            }
            
            .frame(width: 50, height: 50)
        }
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("My Address")
                .font(.headline)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    var body: some View {
        VStack{
  
        if(viewModel.isLoading){
            if viewModel.iserror{
                LottieView(lottieFile: "error")
            }else{
                LottieView(lottieFile: "loading")
            }
        }else{
            VStack{
                NavigationBarView()
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 10) {
                        if(viewModel.address.count == 0){
                            NoProducts(type: "address")
                        }else{
                            ForEach(viewModel.address, id: \.id) { address in
                                AddressCell(address: address)
                                    .overlay(
                                        deleteButton(id: address.id!)
                                        .padding([.top, .trailing], 10)
                                    , alignment: .topTrailing
                                    ).onTapGesture {
                                        if isComingFromPayment{
                                            checkOutViewMode.customerAddress = address
                                            self.presentationMode.wrappedValue.dismiss()
                                        }
                                        if isComingFromSettings{
                                            settingsViewModel.saveAddress(address: address)
                                            self.presentationMode.wrappedValue.dismiss()
                                        }
                                    }
                                LineView()
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                    
                })
            }.background(MotionAnimationView()).navigationBarBackButtonHidden(true)
        }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                viewModel.featchAddress()
            }
            viewModel.featchAddress()
            viewModel.isLoading = true
        }
        .alert(isPresented: $showAlert) {
                    Alert(title: Text("Important message"), message: Text("Do You Want To Delete This Address"), primaryButton: .destructive(Text("Cancel")), secondaryButton: .default(Text("OK"), action: {
                        viewModel.deleteAddress(id: id)
                    }))
                }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView()
    }
}
