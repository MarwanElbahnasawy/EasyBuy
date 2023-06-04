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
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: CustomerAccessTokenCreateMutation(input: CustomerAccessTokenCreateInput(email: email, password: password)), responseModel: CustomerAccessTokenCreateData.self, completion: { result in
            switch result {
            case .success(let response):
                if let token = response.customerAccessTokenCreate?.customerAccessToken {
                    print("New token created: \(token.accessToken ?? "N/A")")
                    // Save token to UserDefaults
                    UserDefaults.standard.set(token.accessToken, forKey: "accessToken")
                    // TODO: Navigate to next view
                } else {
                    // Token not created
                    showAlert(title: "Error", message: "The email or password you entered is incorrect.")
                }
            case .failure(let error):
                // Show GraphQL error
                showAlert(title: "GraphQL Error", message: "\(error.localizedDescription)")
            }
        })
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            UIApplication.shared.windows.first?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
