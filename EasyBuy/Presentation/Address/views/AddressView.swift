//
//  AddressView.swift
//  EasyBuy
//
//  Created by mo_fathy on 15/06/2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var viewModel = AddressViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
        @State var iserror = viewModel.iserror
        if(viewModel.isLoading){
            if iserror{
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
                                LineView()
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                    
                })
            }.background(MotionAnimationView()).navigationBarBackButtonHidden(true)
        }
        }.onAppear{
            viewModel.featchAddress()
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView()
    }
}
