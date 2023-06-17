import SwiftUI

struct SignUpButtonView: View {
    var body: some View {
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
