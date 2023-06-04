import Foundation

class RegestrationViewModel: ObservableObject {
    @Published var customer: CustomerCreateData?
    @Published var isActive = false
    func createCustomer(newCustomerInput: CustomerCreateInput) {
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: CustomerCreateMutation(input: newCustomerInput), responseModel: CreateCustomerResponse.self, completion: { result in
            switch result {
            case .success(let response):
                self.customer = response.data
                self.isActive = true
                UserDefaults.standard.set(response.data?.customerCreate?.customer?.id, forKey: "customerID")
            case .failure(let error):
                print("Failed to create customer due to error: \(error.localizedDescription)")
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
