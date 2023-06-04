//
//  Model.swift
//  EasyBuy
//
//  Created by mo_fathy on 02/06/2023.
//

import SwiftUI

struct Home: View {
    @ObservedObject var viewModel = HomeViewModel()
  // MARK: - Func
    
    fileprivate func TrendingView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Trending")
                        .font(.custom(Constants.AppFont.boldFont, size: 18))
                        .padding(.bottom, -1)
                    Text("You have never seen it before")
                       .font(.custom(Constants.AppFont.boldFont, size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()

            }
            
            LazyVGrid(columns: gridLayout, spacing: 15, content: {
                ForEach(viewModel.items ?? [] ) { product in
                 ProductCell(product: product)
              } //: LOOP
            }) //: GRID
            .padding(15)
    }.padding(.top, 10)
}


  // MARK: - BODY
  
    var body: some View {
        
            ZStack {
                if(viewModel.isLoading){
                    VStack(spacing: 0) {
                        
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
                                            .font(.custom(Constants.AppFont.extraBoldFont, size: 30))
                                            .padding(.bottom, 2)
                                        Text("Our EasyBuy App")
                                           .font(.custom(Constants.AppFont.semiBoldFont, size: 25))
                                            .foregroundColor(.gray)
                                    }.padding(.leading, 15)
                                    Spacer()
                                }.padding(.bottom , 5)
                                    .padding(.leading , 10)
                                
                                CoverImageView()
                                    .frame(height: 200)
                                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                CategoryGridView(brands: viewModel.brands?.smart_collections ?? [])
                                TrendingView()
                                
                            } //: VSTACK
                            
                        }) //: SCROLL
                        
                    } //: VSTACK
                }
                
            } //: ZSTACK
            .ignoresSafeArea(.all, edges: .top)
            .padding(.bottom, 65).onAppear(){
                viewModel.fetchBrands()
                viewModel.fetchProducts()
            }
           
        
    }
}

// MARK: - PREVIEW

struct Home_Previews: PreviewProvider {
  static var previews: some View {
      Home()
      .previewDevice("iPhone 12 Pro")
      
  }
}
