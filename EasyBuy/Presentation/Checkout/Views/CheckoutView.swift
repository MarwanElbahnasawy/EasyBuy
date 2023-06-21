//
//  CheckoutView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 15/06/2023.
//

import SwiftUI
import Combine

struct CheckoutView: View {
    @StateObject var viewModel: CheckoutViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showAlert = false
    @State private var showAlertPayment = false
    @State private var isApply = false
    @State private var isNotApply = false
    var body: some View {
        if viewModel.isLoading{
            LottieView(lottieFile: "loading")
        }
        else
        {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack{
                    VStack {
                        if #available(iOS 16.0, *) {
                            Text("Delivery Address").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
                        }
                        if let customerAddress = viewModel.customerAddress{
                            AddressCell(address: customerAddress )
                                .padding(.horizontal,10).padding(.top,10)
                        }
                        
                        NavigationLink(destination: {
                            AddressView(checkOutViewMode: viewModel,isComingFromPayment: true)
                        }, label: {
                            Text("Address")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        })
                        
                    }
                    .frame(height: UIScreen.main.bounds.height/2)
                    .shadow(radius: 20)
                    .cornerRadius(20)
                    VStack{
                        if #available(iOS 16.0, *) {
                            Text("Products List").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
                        }
                        ScrollView{
                            LazyVStack {
                                ForEach(viewModel.products ?? [], id: \.variant?.id) { item in
                                    FavoriteAndCartCell(imageUrl: URL(string: item.product?.featuredImage?.url ?? "not available"), title: item.product?.title,
                                                        type: item.product?.productType,
                                                        price:formatPrice(price: item.product?.priceRangeV2?.maxVariantPrice?.amount),size: CartListViewModel().getItemSize(item: item.variant?.title),quantity: Int(item.quantity ?? 1), isCheckout: true).padding(.all,10)
                                }
                                
                            }
                            
                        }.background(Color("itemcolor")).frame(height: 20+UIScreen.main.bounds.height/6, alignment: .center).padding()
                    }
                    Spacer()
                    VStack{
                        HStack{
                            TextField("Enter Discount code here", text: $viewModel.discountCodes)
                                .padding(10)
                                .border(Color.gray, width: 1).disabled(true)
                            
                            NavigationLink(destination: {
                                CodesView(selectedValue: 1,isUseable: true,checkoutViewModel: viewModel)
                            }, label: {
                                Text("Get Code")
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            })
                            
                        }.padding(.all,10)
                        Button {
                            showAlert = true
                        } label: {
                            Text("Apply Code")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }.alert(isPresented: $showAlert) {
                            var alert: Alert
                            if viewModel.discountCodes.isEmpty{
                                alert = Alert(title: Text("Warning"), message: Text("Please choose discount code to be applied"))
                            }
                            else{
                                alert = Alert(title: Text("Warning!"), message: Text("Please notice that you can not use this code again"), primaryButton: .default(Text("OK")) {
                                    viewModel.applyDiscountCode()
                                }, secondaryButton: .cancel(Text("Cancel")) {
                                    print("Cancel button tapped")
                                })
                            }
                            return alert
                            }
                        
                        HStack{
                            Text("Total Price:").fontWeight(.semibold)
                            Text("\(formatPrice(price: viewModel.totalPrice))").fontWeight(.thin)
                            Spacer()
                        }.padding(.leading,10).padding(.top,30)
                        HStack{
                            Text("Price After Discounts :").fontWeight(.semibold)
                            Text("\(formatPrice(price: viewModel.priceAfterDiscounts))").fontWeight(.thin)
                            Spacer()
                        }.padding(.leading,10).padding(.top,30)
                    }
                    Button {
                        if viewModel.customerAddress?.address1?.isEmpty == true || viewModel.customerAddress?.address1 == nil{
                            showAlert = true
                        }
                        else{
                            viewModel.updateAdrees()
                        }
                    } label: {
                        NavigationLink {
                            PaymentMethodView(totalPrice: formatPrice(price: viewModel.priceAfterDiscounts)  , products: viewModel.products ?? [],draftOrderID: viewModel.cartDraftOrderID ?? " ")
                        } label: {
            
                                Text("Go To Payment")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .padding(.horizontal, 8)
                                    .background(Color.black)
                                    .cornerRadius(10.0)
                           

                        }.onDisappear{
                            print("disappearing....")
                           
                        }
                    }.alert (isPresented: $showAlertPayment) {
                        Alert(title: Text("Warning"), message: Text("Please choose address"))
                    }
                }
            })
            .onAppear{
                
                viewModel.settingsViewModel.getCurrency()
            }.navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: BackButton(action: { presentationMode.wrappedValue.dismiss() })).background(Color("itemcolor"))
        }
      
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: CheckoutViewModel())
    }
}
