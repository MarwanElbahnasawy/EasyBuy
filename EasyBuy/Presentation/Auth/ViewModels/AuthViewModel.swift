import Foundation

class AuthViewModel: ObservableObject {
    @Published var customer: CustomerCreateData?

    func createCustomer(newCustomerInput: CustomerCreateInput, completion: @escaping (Result<Customer, Error>) -> Void) {
        NetworkManager.shared.performGraphQLRequest(mutation: CustomerCreateMutation(input: newCustomerInput), responseModel: CreateCustomerResponse.self, completion: { result in
            switch result {
            case .success(let response):
                if let customer = response.data?.customerCreate?.customer {
                    self.customer = response.data
                    completion(.success(customer))
                } else if let error = response.data?.customerCreate?.customerUserErrors?.first?.message {
                    completion(.failure(error as! Error))
                }
            case .failure(let error):
                print("Failed to create customer due to error: \(error.localizedDescription)")
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
