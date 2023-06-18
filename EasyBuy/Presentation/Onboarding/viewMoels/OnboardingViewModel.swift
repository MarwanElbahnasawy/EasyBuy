//
//  OnboardingViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 08/06/2023.
//

import Foundation
import SwiftUI

class OnboardingViewModel: ObservableObject {
    init(){
        UserDefaults.standard.currency = "EGP"
        HomeViewModel().getCurrency()
    }
    @Published  var intros: [Intro] = [
        Intro(title: "EasyBuy App", subTitle: "Take Deep Breaths", description: "All That you need , All That you want just Hello at EasyBuy .", img: "scrn1", color: Color("Intro1")),
        
        Intro(title: "Stay Creative", subTitle: "To Discover more Feature", description: "just Join EasyBuy .", img: "scrn2", color: Color("Intro2")),
        
        Intro(title: "Add Payment Way", subTitle: "Create Task List", description: "You can use Apple Pay Or In Cash.", img: "scrn3", color: Color("Intro3")),
    ]
  
}
