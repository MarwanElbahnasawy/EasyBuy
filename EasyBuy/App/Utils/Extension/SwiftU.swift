//
//  SwiftU.swift
//  EasyBuy
//
//  Created by mo_fathy on 04/06/2023.
//


import SwiftUI
import Lottie
 
struct LottieView: UIViewRepresentable {
    var lottieFile: String
 
    let animationView = LottieAnimationView()
 
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
 
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
 
        view.addSubview(animationView)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
 
        return view
    }
 
    func updateUIView(_ uiView: UIViewType, context: Context) {
 
    }
}

//struct SwiftU_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftU()
//    }
//}
