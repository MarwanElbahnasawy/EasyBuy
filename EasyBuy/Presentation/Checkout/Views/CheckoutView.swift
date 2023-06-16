//
//  CheckoutView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 15/06/2023.
//

import SwiftUI
import Combine

struct CheckoutView: View {
    @ObservedObject var viewModel: CheckoutViewModel
    

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                VStack {
                    if #available(iOS 16.0, *) {
                        Text("Delivery Address").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
                    }
                    AddressCell(address: viewModel.customerAddress ?? CustomerAddress())
                        .padding(.leading,10).padding(.top,10)
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
                .frame(height: 300)
                .shadow(radius: 20)
                .cornerRadius(20)
                VStack{
                    if #available(iOS 16.0, *) {
                        Text("Products List").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
                    }
                    List {
                        ForEach(viewModel.products ?? [], id: \.variant?.id) { item in
                            FavoriteAndCartCell(imageUrl: URL(string: item.product?.featuredImage?.url ?? "not available"), title: item.product?.title,
                                                type: item.product?.productType,
                                                price: item.product?.priceRangeV2?.maxVariantPrice?.amount)
                        }
                        
                    }.frame(height: 180, alignment: .center).onAppear{
                        viewModel.getProducts()
                    }
                }
                Spacer()
                VStack{
                    HStack{
                        TextField("Enter Discount code here", text: $viewModel.discountCodes)
                            .padding(10)
                            .border(Color.gray, width: 1)
                        
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
                        
                    }.padding(.horizontal,10)
                    Button {
                        viewModel.applyDiscountCode()
                    } label: {
                        Text("Apply Code")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }

                    HStack{
                        Text("Total Price:").fontWeight(.semibold)
                        Text("\(viewModel.totalPrice)").fontWeight(.thin)
                        Spacer()
                    }.padding(.leading,10).padding(.top,30)
                    HStack{
                        Text("Price After Discounts :").fontWeight(.semibold)
                        Text("\(viewModel.priceAfterDiscounts)").fontWeight(.thin)
                        Spacer()
                    }.padding(.leading,10).padding(.top,30)
                }
                NavigationLink {
                   
                    PaymentMethodView(totalPrice:$viewModel.priceAfterDiscounts , products: viewModel.products ?? [],draftOrderID: viewModel.cartDraftOrderID ?? " ")
                    
                } label: {
                    Text("Go To Payment")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding()
                        .padding(.horizontal, 8)
                        .background(Color.black)
                        .cornerRadius(10.0)
                }
            }
        })
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: CheckoutViewModel())
    }
}
