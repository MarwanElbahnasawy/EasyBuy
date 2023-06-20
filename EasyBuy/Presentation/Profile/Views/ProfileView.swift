import SwiftUI

struct ProfileView: View {
    @State private var confirmingSignOut = false
    @State private var isShowingFAQs = false
    @State private var isShowingAboutUs = false
    @AppStorage("token") var token: String?
    
    var body: some View {
        NavigationView{
            List {
                ProfileSectionView()
                
                GeneralSectionView()
                
                OrdersSectionView()
                
                AccountSectionView(confirmingSignOut: $confirmingSignOut)
                
                PolicySectionView(isShowingFAQs: $isShowingFAQs, isShowingAboutUs: $isShowingAboutUs)
            }
        }
        .padding(.bottom, 50)
        .onAppear(perform: {
            // Fetch customer details
            let token = UserDefaults.standard.string(forKey: "accessToken")
            let email = UserDefaults.standard.string(forKey: "email")
            print("current token is \(token ?? "")")
            print("current email is \(email ?? "")")
            let customerID = UserDefaults.standard.string(forKey: "customerID")
            print("current customerID is \(customerID ?? "")")
        })
        .alert(isPresented: $confirmingSignOut) {
            Alert(title: Text("Sign out?"),
                  message: Text("Are you sure you want to sign out?"),
                  primaryButton: .destructive(Text("Sign Out")) {
                UserDefaults.standard.removeObject(forKey: "accessToken")
                token = ""
            },
                  secondaryButton: .cancel()
            )
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
