import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecuredField = false
    
    @State private var passwordsMatch = false
    @State private var showPassword = false
    @State private var isValid = false
    @State private var hint: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecuredField {
                ZStack {
                    HStack {
                        if showPassword {
                            TextField(placeholder, text: $text, onEditingChanged: { isEditing in
                                hint = isEditing ? getHint(for: title) : nil
                            })
                            .font(.system(size: 14))
                            .textContentType(.password)
                        } else {
                            SecureField(placeholder, text: $text, onCommit: {
                                hint = nil
                            })
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
                    }
                }
            } else {
                HStack {
                    TextField(placeholder, text: $text, onEditingChanged: { isEditing in
                        hint = isEditing ? getHint(for: title) : nil
                    })
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .textContentType(.oneTimeCode)
                    
                    if !text.isEmpty {
                        Image(systemName: isValid ? "checkmark.circle" : "xmark.circle")
                            .foregroundColor(isValid ? .green : .red)
                            .padding(.leading, 6)
                    }
                }
            }

            Divider()

            if let hint = hint {
                Text(hint)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
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
            return ValidationUtils.passwordsMatch(password: text, confirmPassword: input)
        case "Phone Number":
            return ValidationUtils.isValidPhoneNumber(phoneNumber: input)
        default:
            return true
        }
    }
    
    func getHint(for title: String) -> String? {
        switch title {
        case "Email Address":
            return "user@example.com"
        case "First Name", "Last Name":
            return "Only alphabetical characters are allowed"
        case "Password":
            return "At least 6 characters with at least one lowercase letter, one uppercase letter, and one digit."
        case "Confirm Password":
            return "Should match the password"
        case "Phone Number":
            return "Must start with a '+' followed by at least 11 digits"
        default:
            return nil
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
    }
}
