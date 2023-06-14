//
//  Loading.swift
//  EasyBuy
//
//  Created by mo_fathy on 14/06/2023.
//

import SwiftUI

struct Loading: View {
    @State private var animateStrokeStart = false
    @State private var animateStrokeEnd = true
    @State private var isRotating = true
    @State var error = false
    var body: some View {
        if(error){
            ZStack (alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                Image(uiImage: #imageLiteral(resourceName: "1_No Connection"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack (alignment: .leading, spacing: 30) {
                        Text("Oops!..")
                                 .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Text("Something wrong with your \nconnection, Please try \nagain.")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.7)
                    
                    Button(action: {
                        
                    }) {
                        Text("Retry".uppercased())
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .padding(.horizontal, 30)
                            .background(Capsule().foregroundColor(.white))
                    }
                }
                .padding(.horizontal, 70)
                .padding(.bottom, UIScreen.main.bounds.height * 0.1)
            }
            
            
        }else{
            ZStack {
                Image("coffee")
                Circle()
                    .trim(from: animateStrokeStart ? 1/3 : 1/9, to: animateStrokeEnd ? 2/5 : 1)
                    .stroke(lineWidth: 5)
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color(red: 0.0, green: 0.588, blue: 1.0))
                    .rotationEffect(.degrees(isRotating ? 360 : 0))
                    .onAppear() {
                        
                        withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                        {
                            self.isRotating.toggle()
                        }
                        
                        withAnimation(Animation.linear(duration: 1).delay(0.5).repeatForever(autoreverses: true))
                        {
                            self.animateStrokeStart.toggle()
                        }
                        
                        withAnimation(Animation.linear(duration: 1).delay(1).repeatForever(autoreverses: true))
                        {
                            self.animateStrokeEnd.toggle()
                        }
                    }
            }
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}



