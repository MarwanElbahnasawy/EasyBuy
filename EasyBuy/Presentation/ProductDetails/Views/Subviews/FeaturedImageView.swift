//
//  FeaturedImageView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI
import Kingfisher

struct FeaturedImageView: View {
    let imageUrl: String?
    
    var body: some View {
        if let imageUrl = imageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .edgesIgnoringSafeArea(.top)
        }
    }
}
