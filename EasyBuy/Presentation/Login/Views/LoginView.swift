import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    @AppStorage("token") var token: String?
    @State private var signInSuccess = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Image
                Image("Shopify-Symbol")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, 32)
                
                // Form fields
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .textInputAutocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecuredField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // SignIn button
                Button {
                    loginViewModel.createAccessToken(
                        newAccessTokenInput: CustomerAccessTokenCreateInput(
                            email: email,
                            password: password)
                    ) { result in
                        switch result {
                        case .success:
                            // Token created successfully, perform navigation or other actions
                            print("Token created successfully")
                            signInSuccess = true
                        case .failure(let error):
                            // Show the alert when token don't have a value
                            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                        }
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color.black)
                .cornerRadius(10)
                .padding(.top, 24)
                
                // SignIn button
                Button {
                    
                } label: {
                    HStack {
                        Text("GUEST")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color.black)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                // SignUp button
                NavigationLink {
                    RegisterationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Do not have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                }
            }
            .alert(isPresented: $signInSuccess) {
                Alert(title: Text("SignIn success"), message: Text("Enjoy using EasyBuy!"), dismissButton: .default(Text("Ok")) {
                    //    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: Home())
                    token =  loginViewModel.tokenString
                })
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
