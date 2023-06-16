import Foundation

class RegestrationViewModel: ObservableObject {
    @Published var customer: CustomerCreateData?
    @Published var email = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var phoneNumber = ""
    
    func createCustomer(newCustomerInput: CustomerCreateInput, completion: @escaping (Result<Void, Error>) -> Void) {
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: CreateNewCustomerMutation(input: newCustomerInput), responseModel: CustomerCreateData.self, completion: { result in
            switch result {
            case .success(let response):
                if let customerID = response.customerCreate?.customer?.id {
                    print("Success to create account with ID: \(customerID)")
                    let customerIDOj = (response.customerCreate?.customer?.displayName)!
                    + (response.customerCreate?.customer?.phone)!
                    let customerEmail = response.customerCreate?.customer?.email
                    let customerDisplayName = response.customerCreate?.customer?.displayName
                    UserDefaults.standard.set(customerIDOj, forKey: "customerID")
                    UserDefaults.standard.set(customerID, forKey: "shopifyCustomerID")
                    UserDefaults.standard.set(customerEmail, forKey: "email")
                    UserDefaults.standard.set(customerDisplayName, forKey: "displayName")
                    completion(.success(()))
                } else {
                    if let errorMessage = response.customerCreate?.customerUserErrors?.first?.message {
                        print("Failed to create account: \(errorMessage)")
                        completion(.failure(NSError(domain: errorMessage, code: 400, userInfo: nil)))
                    } else {
                        print("Failed to create account: Invalid credentials")
                        completion(.failure(NSError(domain: "Invalid credentials", code: 400, userInfo: nil)))
                    }
                }
            case .failure(let error):
                print("Failed to create account: \(error)")
                completion(.failure(error))
            }
        })
    }
    
    var isFormValid: Bool {
        return ValidationUtils.isValidEmail(email: email)
        && ValidationUtils.isValidPassword(password: password)
        && ValidationUtils.passwordsMatch(password: password, confirmPassword: confirmPassword)
        && ValidationUtils.isValidName(name: firstName)
        && ValidationUtils.isValidName(name: lastName)
        && ValidationUtils.isValidPhoneNumber(phoneNumber: phoneNumber)
    }
}
