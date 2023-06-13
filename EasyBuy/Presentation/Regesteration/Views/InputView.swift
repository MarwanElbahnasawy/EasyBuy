import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecuredField = false
    
    @State private var showPassword = false
    @State private var isValid = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecuredField {
                HStack {
                    if showPassword {
                        TextField(placeholder, text: $text)
                            .font(.system(size: 14))
                            .textContentType(.password)
                    } else {
                        SecureField(placeholder, text: $text)
                            .font(.system(size: 14))
                    }
                    Spacer()
                    Button(action: {
                        showPassword.toggle()
                    }){
                        Image(systemName : showPassword ? "eye.slash" : "eye")
                            .foregroundColor(showPassword ? Color(.systemGray) : Color(.secondaryLabel))
                            .padding(.trailing, 12)
                    }
                    
                    // validation mark beside the eye icon
                    if !text.isEmpty {
                        Image(systemName: isValid ? "checkmark.circle" : "xmark.circle")
                            .foregroundColor(isValid ? .green : .red)
                            .padding(.trailing, 6)
                    }
                }
            } else {
                HStack {
                    TextField(placeholder, text: $text)
                        .font(.system(size: 14))
                        .autocapitalization(.none)
                        .textContentType(.oneTimeCode)
                    
                    // validation mark beside the placeholder
                    if !text.isEmpty {
                        Image(systemName: isValid ? "checkmark.circle" : "xmark.circle")
                            .foregroundColor(isValid ? .green : .red)
                            .padding(.leading, 6)
                    }
                }
            }
            
            Divider()
        }
        .onChange(of: text) { newValue in
            isValid = validate(newValue)
        }
    }
    
    func validate(_ input: String) -> Bool {
        switch title {
        case "Email Address":
            return ValidationUtils.isValidEmail(email: input)
        case "First Name", "Last Name":
            return ValidationUtils.isValidName(name: input)
        case "Password":
            return ValidationUtils.isValidPassword(password: input)
        case "Confirm Password":
            return ValidationUtils.passwordsMatch(password: input, confirmPassword: text)
        case "Phone Number":
            return ValidationUtils.isValidPhoneNumber(phoneNumber: input)
        default:
            return true
        }
    }
}
struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
    }
}
