import SwiftUI

struct RegisterationView: View {
    @ObservedObject var authViewModel = AuthViewModel()

    @State private var email = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var phoneNumber = ""

    var body: some View {
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

                HStack {
                    InputView(text: $firstName,
                              title: "First Name",
                              placeholder: "Enter your first name")

                    InputView(text: $lastName,
                              title: "Last Name",
                              placeholder: "Enter your last name")
                }

                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecuredField: true)

                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your password",
                          isSecuredField: true)

                InputView(text: $phoneNumber,
                          title: "Phone Number",
                          placeholder: "Enter your phone number")
                .keyboardType(.phonePad)
            }
            .padding(.horizontal)
            .padding(.top, 12)

            // SignIn button
            Button(action: {
                createNewCustomer()
            }) {
                HStack {
                    Text("CREATE ACCOUNT")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .disabled(!authViewModel.formIsValid(email: email,
                                                 password: password,
                                                 confirmPassword: confirmPassword,
                                                 firstName: firstName,
                                                 lastName: lastName,
                                                 phoneNumber: phoneNumber))
            .opacity(authViewModel.formIsValid(email: email,
                                                password: password,
                                                confirmPassword: confirmPassword,
                                                firstName: firstName,
                                                lastName: lastName,
                                                phoneNumber: phoneNumber) ? 1 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)

            Spacer()
        }
    }
    
    func createNewCustomer() {
        let newCustomerInput = CustomerCreateInput(firstName: firstName,
                                                   lastName: lastName,
                                                   email: email,
                                                   phone: phoneNumber,
                                                   password: password)
        authViewModel.createCustomer(newCustomerInput: newCustomerInput) { result in
            switch result {
            case .success(let customer):
                if let customerId = customer.id {
                    print("Successfully created customer with ID: \(customerId)")
                    // Handle successful customer creation
                }
            case .failure(let error):
                print("Failed to create customer: \(error.localizedDescription)")
                // Handle customer creation failure
            }
        }
    }
}

struct RegisterationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterationView()
    }
}
