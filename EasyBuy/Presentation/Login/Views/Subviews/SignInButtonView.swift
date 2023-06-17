import SwiftUI

struct SignInButtonView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    var email: String
    var password: String
    @Binding var signInSuccess: Bool
    
    var body: some View {
        Button {
            loginViewModel.createAccessToken(
                newAccessTokenInput: CustomerAccessTokenCreateInput(email: email, password: password)
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
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let window = windowScene.windows.first {
                        window.rootViewController?.present(alert, animated: true)
                    }
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
    }
}
