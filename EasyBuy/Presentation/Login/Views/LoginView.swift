import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()

    @State private var email = ""
    @State private var password = ""
    
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
                    createAccessToken()
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
        }
    }
    
    func createAccessToken() {
        
        let newAccessTokenInput = CustomerAccessTokenCreateInput(email: email, password: password)
        loginViewModel.createAccessToken(newAccessTokenInput: newAccessTokenInput)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if let token = self.loginViewModel.token?.customerAccessTokenCreate?.customerAccessToken?.accessToken {
                // Save token in UserDefaults
                UserDefaults.standard.set(token, forKey: "accessToken")
                
                // Navigate to another view
                navigateToSwiftUIView()
            } else if let error = self.loginViewModel.token?.customerAccessTokenCreate?.customerAccessTokenError?.first?.message {
                // Handle token creation errors
                print("Error while creating access token: \(error)")
            } else {
                // Token creation failed
                print("Failed to create access token")
            }
        }
    }

    func navigateToSwiftUIView() {
        let view = SwiftUIView()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: view)
            window.makeKeyAndVisible()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
