import SwiftUI

struct RegisterationView: View {
    @ObservedObject var regestrationViewModel = RegestrationViewModel()
    
    @State private var signUpSuccess = false
    @State private var email = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var phoneNumber = ""
    @Environment (\.dismiss) var dismiss
    
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
                regestrationViewModel.createCustomer(newCustomerInput: CustomerCreateInput(
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    phone: phoneNumber,
                    password: password)) { result in
                        switch result {
                        case .success:
                            // Token created successfully, perform navigation or other actions
                            print("Account created successfully")
                            signUpSuccess = true
                        case .failure(let error):
                            // Show the alert when token don't have a value
                            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                        }
                    }
            }) {
                HStack {
                    Text("CREATE ACCOUNT")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color.black)
            .disabled(!regestrationViewModel.formIsValid(email: email,
                                                         password: password,
                                                         confirmPassword: confirmPassword,
                                                         firstName: firstName,
                                                         lastName: lastName,
                                                         phoneNumber: phoneNumber))
            .opacity(regestrationViewModel.formIsValid(email: email,
                                                       password: password,
                                                       confirmPassword: confirmPassword,
                                                       firstName: firstName,
                                                       lastName: lastName,
                                                       phoneNumber: phoneNumber) ? 1 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
        .alert(isPresented: $signUpSuccess) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")){
                UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: LoginView(email: email,password: password))

            })
                }
        }
    }
    
//    func createNewCustomer() {
//        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: CustomerCreateMutation(input: CustomerCreateInput(firstName: phoneNumber, lastName: firstName, email: lastName, phone: email, password: password)), responseModel: CustomerCreateData.self, completion: { result in
//            switch result {
//            case .success(let response):
//                if let customer = response.customerCreate?.customer {
//                    print("New customer created with ID: \(customer.id ?? "N/A")")
//                    // TODO: Navigate to Login
//                    self.isActive = true
//                    NavigationLink(destination: LoginView(), isActive: $isActive) {
//                        EmptyView()
//                    }
//                } else {
//                    print("Failed to create customer")
//                }
//            case .failure(let error):
//                print("Failed to create customer due to error: \(error.localizedDescription)")
//            }
//        })
//    }

struct RegisterationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterationView()
    }
}
