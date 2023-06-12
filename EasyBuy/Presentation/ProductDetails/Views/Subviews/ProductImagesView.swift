//
//  ProductImagesView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 12/06/2023.
//

import SwiftUI
import Kingfisher

struct ProductImagesView: View {
    var images: [FeaturedImage]?
    
    var body: some View {
        if let images = images, !images.isEmpty {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(images, id: \.id) { image in
                            KFImage(URL(string: image.url ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                        }
                    }
                }
            }
            .frame(height: UIScreen.main.bounds.width)
        }
    }
}

struct ProductImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ProductImagesView()
    }
}
