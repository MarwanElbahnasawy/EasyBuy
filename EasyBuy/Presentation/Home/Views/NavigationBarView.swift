//
//  NavigationBarView.swift
//  EasyBuy
//
//  Created by mo_fathy on 01/06/2023.
//

import SwiftUI

struct NavigationBarView: View {
  // MARK: - PROPERTY
  
  @State var isAnimated: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
        NavigationLink(destination: SearchView()) {
            Image(systemName: "magnifyingglass")
                .font(.title)
                .foregroundColor(Color("myblack"))
        }
      
      Spacer()
      
      LogoView()
        .opacity(isAnimated ? 1 : 0)
        .offset(x: 0, y: isAnimated ? 0 : -25)
        .onAppear(perform: {
          withAnimation(.easeOut(duration: 0.5)) {
            isAnimated.toggle()
          }
        })
      
      Spacer()
      
    
    }.onAppear{
        isAnimated = false
    }//: HSTACK
  }
}

// MARK: - PREVIEW

struct NavigationBarView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
