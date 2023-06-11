//
//  CategoryItemView.swift
//  EasyBuy
//
//  Created by mo_fathy on 02/06/2023.
//
import SwiftUI


struct CategoryItemView: View {
  // MARK: - PROPERTY
  
  let brand: Brand
  // MARK: - BODY
  
  var body: some View {
      HStack(alignment: .center, spacing: 6) {
          KingFisherImageView(url: brand.image?.url ?? "https://theperfectroundgolf.com/wp-content/uploads/2022/04/placeholder.png",placeholder: "")

          .resizable()
          .scaledToFit()
          .frame(width: UIScreen.main.bounds.width * 0.08, height: UIScreen.main.bounds.width * 0.08, alignment: .center)
          .foregroundColor(.gray)

          Text(brand.title?.uppercased() ?? "brand")
          .fontWeight(.light)
          .foregroundColor(.gray)


        Spacer()
      } //: HSTACK
      .padding()
      .background(Color.white.cornerRadius(12))
      .background(
        RoundedRectangle(cornerRadius: 12)
          .stroke(Color.gray, lineWidth: 1)
      )
  }
}

// MARK: - PREVIEW

struct CategoryItemView_Previews: PreviewProvider {
  static var previews: some View {
      let brand = Brand()
    CategoryItemView(brand: brand)
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
