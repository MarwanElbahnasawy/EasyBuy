import SwiftUI

struct FormFieldsView: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack(spacing: 24) {
            InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                .textInputAutocapitalization(.none)
            
            InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecuredField: true)
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
}
