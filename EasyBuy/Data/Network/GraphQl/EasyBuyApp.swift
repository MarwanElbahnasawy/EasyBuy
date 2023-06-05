//
//  EasyBuyApp.swift
//  EasyBuy
//
//  Created by Marwan Elbahnasawy on 31/05/2023.
//

import SwiftUI

@main
struct EasyBuyApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @AppStorage("barIsShow") var barIsShow: Bool = true
    var body: some Scene {
        WindowGroup {
            NavigationView{
                if isOnboarding {
                    Onboarding()
                } else {
                BaseView()
                }
            }
        }
    }
}
