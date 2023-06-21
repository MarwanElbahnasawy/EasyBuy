

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct EasyBuyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared

  @StateObject var networkChecker = NetworkReachability()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ZStack{
                    if !networkChecker.reachable{
                        Loading( error: true )
                    }else{
                        _NavigationView()
                    }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
