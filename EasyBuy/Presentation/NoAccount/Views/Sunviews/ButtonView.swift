import SwiftUI

struct ButtonView: View {
    @Binding var showRegistrationSheet: Bool
    @Binding var showLoginSheet: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            Button(action: {
                showRegistrationSheet = true
            }) {
                Text("Sign Up")
                    .frame(width: 300)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showRegistrationSheet) {
                RegisterationView()
            }
            
            Button(action: {
                showLoginSheet = true
            }) {
                Text("Sign In")
                    .frame(width: 300)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showLoginSheet) {
                LoginView()
            }
        }
    }
}
