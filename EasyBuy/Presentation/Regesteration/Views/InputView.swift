import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecuredField = false

    @State private var showPassword = false

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
                }
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .textContentType(.oneTimeCode)
            }

            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
    }
}
