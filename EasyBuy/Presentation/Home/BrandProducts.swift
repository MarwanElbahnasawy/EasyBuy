//
//  BrandProducts.swift
//  final test
//
//  Created by mo_fathy on 02/06/2023.
//

import SwiftUI

struct BrandProducts: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel:BrandViewModel = BrandViewModel()
    var body: some View {
  
            VStack {
                                if(viewModel.isLoading){
                
                                }else{
                HStack{
                    let brand = "\(viewModel.brand ?? "adidas") PRODUCTS"
                    TitleView(title: brand)
                        .font(.custom(Constants.AppFont.boldFont, size: 18))
                }
                ProductCatalog(products:viewModel.items ?? [])
        }
            }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
        
            .onAppear(){
                   viewModel.fetchBrand()
            }
        //ZStack
        
    }
    
}

struct BrandProducts_Previews: PreviewProvider {
    static var previews: some View {
        BrandProducts()
    }
}
