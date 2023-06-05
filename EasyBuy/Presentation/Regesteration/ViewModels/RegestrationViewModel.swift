import Foundation

class RegestrationViewModel: ObservableObject {
    @Published var customer: CustomerCreateData?
    
    func createCustomer(newCustomerInput: CustomerCreateInput, completion: @escaping (Result<Void, Error>) -> Void) {
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: CustomerCreateMutation(input: newCustomerInput), responseModel: CustomerCreateData.self, completion: { result in
            switch result {
            case .success(let response):
                if let customerID = response.customerCreate?.customer?.id {
                    print("Success to create account with ID: \(customerID)")
                    UserDefaults.standard.set(customerID, forKey: "customerID")
                    completion(.success(()))
                } else {
                    print("Failed to create account: Invalid credentials")
                    completion(.failure(NSError(domain: "Invalid credentials", code: 400, userInfo: nil)))
                }
            case .failure(let error):
                print("Failed to create account: \(error)")
                completion(.failure(error))
            }
        })
    }
    
    func formIsValid(email: String, password: String, confirmPassword: String, firstName: String, lastName: String, phoneNumber: String) -> Bool {
        !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !firstName.isEmpty
        && !lastName.isEmpty
        && !phoneNumber.isEmpty
    }
}
