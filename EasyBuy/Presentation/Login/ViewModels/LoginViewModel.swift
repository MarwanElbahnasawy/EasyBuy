import Foundation

class LoginViewModel: ObservableObject {
    @Published var token: CustomerAccessTokenCreateData?
    @Published var tokenString: String?
    
    func createAccessToken(newAccessTokenInput: CustomerAccessTokenCreateInput, completion: @escaping (Result<Void, Error>) -> Void) {
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: CustomerAccessTokenCreateMutation(input: newAccessTokenInput), responseModel: CustomerAccessTokenCreateData.self, completion: { result in
            switch result {
            case .success(let response):
                if let token = response.customerAccessTokenCreate?.customerAccessToken?.accessToken {
                    print("Success to create access token: \(token)")
                    UserDefaults.standard.set(token, forKey: "accessToken")
                    self.tokenString = token
                    self.featchEmail()
                    completion(.success(()))
                } else {
                    if let errorMessage = response.customerAccessTokenCreate?.customerAccessTokenError?.first?.message {
                        print("Failed to create access token: \(errorMessage)")
                        completion(.failure(NSError(domain: errorMessage, code: 400, userInfo: nil)))
                    } else {
                        print("Failed to create access token: Invalid credentials")
                        completion(.failure(NSError(domain: "Invalid credentials", code: 400, userInfo: nil)))
                    }
                }
            case .failure(let error):
                print("Failed to create access token: \(error)")
                completion(.failure(error))
            }
        })
    }
    func featchEmail(){
        guard let token = UserDefaults.standard.string(forKey: "accessToken") else { return }
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query:QueryGetAddressQuery(customerAccessToken: token,first: 20) , responseModel: DataClassAddress.self, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
               let customerIDOj = (success.customer?.displayName ?? "") + (success.customer?.phone ?? "")
                let customerID = success.customer?.id
                let email = success.customer?.email
                let customerDisplayName = success.customer?.displayName
                UserDefaults.standard.set(customerIDOj, forKey: "customerID")
                UserDefaults.standard.set(customerID, forKey: "shopifyCustomerID")
                UserDefaults.standard.set(email, forKey: "email")
                UserDefaults.standard.set(customerDisplayName, forKey: "displayName")
            case .failure(let failure):
                print(failure)
            }
        })
    }
}
