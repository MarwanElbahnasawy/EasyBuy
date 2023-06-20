//
//  Category.swift
//  final test
//
//  Created by mo_fathy on 02/06/2023.
//

import SwiftUI

struct Category: View {
    @ObservedObject var viewModel = CategoryViewModel()
    @Namespace private var animation
    @State private var isModalPresented: Bool = false
    @AppStorage("isGridCat") var isGrid = true
   
    var body: some View {
            if(viewModel.isLoading){
                if viewModel.iserror{
                    LottieView(lottieFile: "error")
                }else{
                    LottieView(lottieFile: "loading")
                }
            }else{
                VStack {
                    HStack{
                        NavigationBarView()
                        Button(action: {
                            self.isModalPresented = true
                        }, label: {
                            ZStack {
                                Image(systemName: "slider.horizontal.3")
                                    .font(.title)
                                    .foregroundColor(Color("myblack"))
                            }
                        }) //: BUTTON
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    VStack(spacing: 15) {
                        HStack {
                            Text("category")
                                .font(.largeTitle.bold())
                            Spacer()
                            Button(action: {
                                isGrid = !isGrid
                            }) {
                                Image(systemName:  isGrid ? "square.fill.text.grid.1x2" : "square.grid.2x2")
                                    .font(.title2).padding(.trailing , 10).foregroundColor(Color("myblack"))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 15)
                        TagsView()
                    }.padding(.leading)
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 0) {
                            if(viewModel.products.count == 0){
                                NoProducts()
                            }else{
                                LazyVGrid(columns: isGrid ? gridLayout : lineLayout, spacing: 15, content: {
                                    ForEach(viewModel.products ) { product in
                                        if isGrid { ProductCell(product: product)
                                        }else {
                                            ProductRow(product: product)
                                        }
                                    } //: LOOP
                                })//: GRID
                                .padding(15)
                            }
                        }
                    }
                    )}.ignoresSafeArea(.all, edges: .top)
                    .padding(.bottom, 65)
                    .partialSheet(presented: $isModalPresented) {
                        VStack {
                            Text("Filter By")
                                .font(.headline)
                                .padding()
                            
                            VStack(alignment: .leading) {
                                ScrollView{
                                    ForEach(viewModel.arrFilter, id: \.self) { value in
                                        Button(action: {
                                            self.isModalPresented = false
                                            viewModel.filterBy = value
                                            viewModel.filterTag()
                                        }) {
                                            Text(value)
                                                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                                                .padding()
                                                .foregroundColor(viewModel.filterBy == value ? Color.red  : Color.black)
                                                .font(.body)
                                            Spacer()
                                        }.frame(height: 40)
                                    }
                                    Spacer()
                                }
                            }.padding(.leading, 10)
                        }.frame(height: 350)
                    }
            }
    }
    
    /// Tags View
    @ViewBuilder
    func TagsView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.system(size: 20))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background {
                            if viewModel.activeTag == tag {
                                Capsule()
                                    .fill(Color.black)
                                    .matchedGeometryEffect(id: "ACTIVETAG", in: animation) // Added
                            } else {
                                Capsule()
                                    .fill(.gray.opacity(0.2))
                            }
                        }
                        .foregroundColor(viewModel.activeTag == tag ? .white : .gray)
                    /// Changing Active Tag when tapped one of the tag
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                viewModel.activeTag = tag
                                viewModel.filter()
                            }
                        }
                }
            }
        }
        
        .onAppear(){
            
            viewModel.onAppearView()
        }
        
    }
    
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category()
    }
}
