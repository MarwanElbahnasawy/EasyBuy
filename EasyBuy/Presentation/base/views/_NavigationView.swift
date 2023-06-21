//
//   NavigationView.swift
//  EasyBuy
//
//  Created by mo_fathy on 20/06/2023.
//

import SwiftUI

struct _NavigationView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @AppStorage("token") var token: String?
    
    var body: some View {
        if isOnboarding {
            Onboarding()
        } else {
            if token == "" || token == "iNeedSign"{
                LoginView()
            }else{
                BaseView()
            }
        }
    }
}

struct _NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        _NavigationView()
    }
}
