//
//  LogoView.swift
//  EasyBuy
//
//  Created by mo_fathy on 01/06/2023.
//

import SwiftUI

struct LogoView: View {
  var body: some View {
    HStack(spacing: 4) {
      Text("easy".uppercased())
        .font(.title3)
        .fontWeight(.black)

      
      Image("logo-dark")
        .resizable()
        .scaledToFit()
        .frame(width: 30, height: 30, alignment: .center)
      
      Text("buy".uppercased())
        .font(.title3)
        .fontWeight(.black)

    } //: HSTACK
  }
}

struct LogoView_Previews: PreviewProvider {
  static var previews: some View {
    LogoView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
