//
//  CoverImageView.swift
//  EasyBuy
//
//  Created by mo_fathy on 03/06/2023.
//

import SwiftUI
import Combine
struct CoverImageView: View {
    // MARK: - PROPERTIES
    
    var coverImages: [CoverImage] = Bundle.main.decode("covers.json")

    @State private var selectedIndex = 0
    @State private var adType: AdType = .all
    @State private var timer: Publishers.Autoconnect<Timer.TimerPublisher>?
    // MARK: - BODY
    var body: some View {
   ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1), alignment: .center, spacing: 15, pinnedViews: [], content: {
                    ForEach(coverImages, id:\.self) { item in
                        
                        HStack {

                            image(CoverImage: item).padding(.horizontal, 10)

                                
                        }
                    }
                    .onAppear {
                        withAnimation {
                            proxy.scrollTo(coverImages[selectedIndex])
                        }
                    }
                    .onReceive(timer ??  Timer.publish(every: 3, on: .main, in: .common)
                        .autoconnect()) { _ in
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
                ).padding(.horizontal)
                  
                 
            }
   }.onAppear{
       startTimer()
   }
   .onDisappear{
       stopTimer()
   }
    }
    
    func startTimer() {
           timer = Timer.publish(every: 3, on: .main, in: .common)
               .autoconnect()
               
       }
       
       func stopTimer() {
           timer?.upstream.connect().cancel()
       }

}

// MARK: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
  static var previews: some View {
    CoverImageView()
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
