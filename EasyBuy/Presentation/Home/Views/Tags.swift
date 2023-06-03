//
//  Tags.swift
//  EasyBuy
//
//  Created by mo_fathy on 03/06/2023.
//

import SwiftUI

struct Tags: View {
        /// View Properties
         var tags: [String]
        @State  var activeTag: String
        /// For Matched Geometry Effect
        @Namespace private var animation // Added
        var body: some View {
            VStack(spacing: 15) {
                HStack {
                    Text("category")
                        .font(.largeTitle.bold())
                    
                    Text("Recommended")
                        .fontWeight(.semibold)
                        .padding(.leading, 15)
                        .foregroundColor(.gray)
                        .offset(y: 2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                .padding(.horizontal, 15)
                
                TagsView()
            }
        }
        
        /// Tags View
        @ViewBuilder
        func TagsView() -> some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(tags, id: \.self) { tag in
                        Text(tag)
                            .font(.system(size: 20))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 5)
                            .background {
                                if activeTag == tag {
                                    Capsule()
                                        .fill(Color(.systemBlue))
                                        .matchedGeometryEffect(id: "ACTIVETAG", in: animation) // Added
                                } else {
                                    Capsule()
                                        .fill(.gray.opacity(0.2))
                                }
                            }
                            .foregroundColor(activeTag == tag ? .white : .gray)
                            /// Changing Active Tag when tapped one of the tag
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                    activeTag = tag
                                }
                            }
                    }
                }
            }
        
    }

}

struct Tags_Previews: PreviewProvider {
    static var previews: some View {
        let tags: [String] =   [
            "all","man", "women", "kids"
        ]
        Tags(tags: tags, activeTag: tags[0])
    }
}
