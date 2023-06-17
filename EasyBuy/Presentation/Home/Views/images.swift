//
//  images.swift
//  EasyBuy
//
//  Created by mo_fathy on 17/06/2023.
//

import SwiftUI

struct images: View {
    var product:Product?
    func getImages(product:Product)-> [String]{
        var images : [String] = []
        if let image = product.featuredImage?.url{
            // images  = [image]
            for item in product.images?.edges ?? []{
                images.append(item.node?.url ?? "https://theperfectroundgolf.com/wp-content/uploads/2022/04/placeholder.png")
            }
        }else{
            images  = ["https://theperfectroundgolf.com/wp-content/uploads/2022/04/placeholder.png"]
        }
        return images
    }
    var body: some View {
        TabView {
            ForEach(getImages(product: product!)) { image in
                KingFisherImageView(url: image ,placeholder: "")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(10)
            } //: LOOP
        }//: TAB
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .onAppear {
            setupAppearance()
        }
        
        
    }
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray
    }
}

struct images_Previews: PreviewProvider {
    static var previews: some View {
        images()
    }
}
