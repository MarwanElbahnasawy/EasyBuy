//
//  CoverImageView.swift
//  EasyBuy
//
//  Created by mo_fathy on 03/06/2023.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1), alignment: .center, spacing: 15, pinnedViews: [], content: {
                ForEach(coverImages) { item in
                    image(CoverImage: item)
                }
            })

        }).padding(.leading,10)
    }
}

// MARK: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
  static var previews: some View {
    CoverImageView()
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
