//
//  CategoryGridView.swift
//  EasyBuy
//
//  Created by mo_fathy on 01/06/2023.
//
import SwiftUI

struct CategoryGridView: View {
  // MARK: - PROPERTY
    var brands : [Brand]
  // MARK: - BODY
  
    var body: some View {
       
            ScrollView(.horizontal, showsIndicators: false, content: {
                LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                    Section(
                        header: SectionView(rotateClockwise: false),
                        footer: SectionView(rotateClockwise: true)
                    ) {
                        ForEach(brands ,id:\.id) { brand in
                            NavigationLink {
                                var VM = BrandViewModel(id:brand.handle , brand: brand.title)
                                BrandProducts(viewModel: VM)
                            } label: {
                                CategoryItemView(brand: brand)
                            }
                        }
                    }
                }) //: GRID
                .frame(height: 140)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }) //: SCROLL
        
    }
}

// MARK: - PREVIEW

struct CategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
      let brand = Brand(title: "title")
      let brands :[Brand] = [brand,brand,brand,brand,brand]
      CategoryGridView(brands: brands)
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
