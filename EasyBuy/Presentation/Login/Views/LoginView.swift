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
            }.navigationViewStyle(StackNavigationViewStyle())
            .alert(isPresented: $signInSuccess) {
                Alert(title: Text("Sign In success"), message: Text("Enjoy using EasyBuy!"), dismissButton: .default(Text("Ok")) {
                    token = loginViewModel.tokenString
                    Useremail = email
                })
            }
            .navigationBarBackButtonHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
