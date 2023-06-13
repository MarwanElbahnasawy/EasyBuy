//
//  SizesView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI

struct SizesView: View {
    let variants: [VariantsEdge]?
    @ObservedObject var viewModel: ProductViewModel
    @State private var selectedItem: VariantsEdge?
    var body: some View {
        if let variants = variants {
            Text("Sizes")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            HStack {
                ForEach(variants, id: \.node?.id) { sizeOption in
             
                        Text(sizeOption.node?.title?.split(separator: "/").first ?? "not available")
                            .foregroundColor(.black)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(self.selectedItem?.node?.id == sizeOption.node?.id ? Color(uiColor: .lightGray): Color.white)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 1)
                            ).onAppear{
                                selectedItem = variants.first
                                viewModel.varaintID = selectedItem?.node?.id
                            }
                            .onTapGesture {
                                selectedItem = sizeOption
                                viewModel.varaintID = selectedItem?.node?.id
                            }
                    
                }.onAppear{
                    selectedItem = variants.first
                }
            }
        }
    }
    
}
