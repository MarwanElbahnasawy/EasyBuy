

import SwiftUI

struct Home: View {
 
    var brands: SmartCollections = Bundle.main.decode("brand.json")
   
    var items: ResProducts = Bundle.main.decode("products.json")
  // MARK: - Func
    
    fileprivate func TrendingView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Trending")
                        .font(.custom(Constants.AppFont.boldFont, size: 18))
                        .padding(.bottom, -1)
                    Text("You have never seen it before")
                       .font(.custom(Constants.AppFont.semiBoldFont, size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("VIEW ALL")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                       .foregroundColor(Color("Red"))
                        .padding(.trailing, 15)
                }
            }
            
            LazyVGrid(columns: gridLayout, spacing: 15, content: {
                ForEach(items.products ) { product in
                 ProductCell(product: product)
                //    ProductItem(product: product)
              } //: LOOP
            }) //: GRID
            .padding(15)
    }.padding(.top, 10)
}


  // MARK: - BODY
  
    var body: some View {
        NavigationView{
            ZStack {
                
                VStack(spacing: 0) {
                    HStack{
                        NavigationBarView()
                        Button(action: {}, label: {
                          ZStack {
                            Image(systemName: "cart")
                              .font(.title)
                              .foregroundColor(.black)
                            
                            Circle()
                              .fill(Color.red)
                              .frame(width: 14, height: 14, alignment: .center)
                              .offset(x: 13, y: -10)
                          }
                        }) //: BUTTON
                    }
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 5) {
                            CoverImageView()
                                .frame(height: 300)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            CategoryGridView(brands: brands.smart_collections)
                            TrendingView()
                            
                        } //: VSTACK
                        
                    }) //: SCROLL
                    
                } //: VSTACK
                
                
            } //: ZSTACK
            .ignoresSafeArea(.all, edges: .top)
            .padding(.bottom, 65)
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
