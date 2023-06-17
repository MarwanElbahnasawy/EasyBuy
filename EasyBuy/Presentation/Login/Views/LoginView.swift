import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    @AppStorage("token") var token: String?
    @AppStorage("email") var Useremail: String?
    @State private var signInSuccess = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                LoginLogoView()
                
                FormFieldsView(email: $email, password: $password)
                
                SignInButtonView(loginViewModel: loginViewModel, email: email, password: password, signInSuccess: $signInSuccess)
                
                GuestButtonView(token: $token)
                
                Spacer()
                
                SignUpButtonView()
            }
            .alert(isPresented: $signInSuccess) {
                Alert(title: Text("SignIn success"), message: Text("Enjoy using EasyBuy!"), dismissButton: .default(Text("Ok")) {
//                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                       let window = windowScene.windows.first {
//                        window.rootViewController = UIHostingController(rootView: Home())
//                    }
                    token = loginViewModel.tokenString
                    Useremail = email
                })
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
