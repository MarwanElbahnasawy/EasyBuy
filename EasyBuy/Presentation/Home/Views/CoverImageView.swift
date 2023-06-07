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
    @State private var selectedIndex = 0
    private var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    // MARK: - BODY
    var body: some View {
   ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1), alignment: .center, spacing: 15, pinnedViews: [], content: {
                    ForEach(coverImages, id:\.self) { item in
                        HStack {
                            image(CoverImage: item)
                        }
                    }
                    .onAppear {
                        withAnimation {
                            proxy.scrollTo(coverImages[selectedIndex])
                        }
                    }
                    .onReceive(timer) { _ in
                        withAnimation {
                            if selectedIndex < coverImages.count - 1 {
                                
                                selectedIndex += 1
                                proxy.scrollTo(coverImages[selectedIndex])
                            }else{
                                selectedIndex = 0
                            }
                        }
                    }
                }
                ).padding(.horizontal,10)
            }
        }
    }
}

// MARK: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
  static var previews: some View {
    CoverImageView()
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
