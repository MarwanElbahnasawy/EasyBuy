//
//  Model.swift
//  EasyBuy
//
//  Created by mo_fathy on 02/06/2023.
//

import SwiftUI

struct Home: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var isGrid = true
    
    // MARK: - Func
    
    fileprivate func TrendingView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Trending")
                        .font(.custom(Constants.AppFont.boldFont, size: UIScreen.main.bounds.width * 0.04))
                        .padding(.bottom, -1)
                    Text("You have never seen it before")
                        .font(.custom(Constants.AppFont.boldFont, size: UIScreen.main.bounds.width * 0.02))
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                    isGrid = !isGrid
                }) {
                    Image(systemName:  isGrid ? "square.fill.text.grid.1x2" : "square.grid.2x2")
                        .font(.title2).padding(.trailing , 10).foregroundColor(Color("myblack"))
                
                }
            }
            
            LazyVGrid(columns: isGrid ? gridLayout : lineLayout, spacing: 15, content: {
                ForEach(viewModel.items ?? [] ) { product in
                    if isGrid { ProductCell(product: product)
                    }else {
                        ProductRow(product: product)
                    }
                } //: LOOP
            }) //: GRID
            .padding(15)
        }.padding(.top, 10)
    }
    
    
    // MARK: - BODY
    
    var body: some View {

        ZStack {
            if(viewModel.isLoading){
                if viewModel.iserror{
                    LottieView(lottieFile: "error")
                }else{
                    LottieView(lottieFile: "loading")
                }
                    
    
            }else{
                VStack(spacing: 0) {
                    HStack{
                        NavigationBarView()
                        Image("personplaceholder")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.black)  //: Image
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 5) {
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Welcome,")
                                        .font(.custom(Constants.AppFont.extraBoldFont, size: UIScreen.main.bounds.width * 0.07))
                                        .padding(.bottom, 2)
                                    Text("Our EasyBuy App")
                                        .font(.custom(Constants.AppFont.semiBoldFont, size: UIScreen.main.bounds.width * 0.04))
                                        .foregroundColor(.gray)
                                }.padding(.leading, 15)
                                Spacer()
                            }.padding(.bottom , 5)
                                .padding(.leading , 10)
                            
                            CoverImageView()
                            //  .frame(height: 200)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            CategoryGridView(brands: viewModel.brands ?? [])
                            TrendingView()
                            
                        } //: VSTACK
                        
                    }) //: SCROLL
                    
                } //: VSTACK
            }
            
        } //: ZSTACK
        .ignoresSafeArea(.all, edges: .top)
        .padding(.bottom, 65)

                .onAppear(perform: {
                    viewModel.getCurrency()
                    viewModel.fetchBrands()
                    viewModel.fetchProducts()
                })
    

        
        
    }
}

// MARK: - PREVIEW

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewDevice("iPhone 12 Pro")
        
    }
}
