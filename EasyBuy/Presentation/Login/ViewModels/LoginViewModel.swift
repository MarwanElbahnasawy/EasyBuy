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
                    completion(.success(()))
                } else {
                    print("Failed to create access token: Invalid credentials")
                    completion(.failure(NSError(domain: "Invalid credentials", code: 400, userInfo: nil)))
                }
            case .failure(let error):
                print("Failed to create access token: \(error)")
                completion(.failure(error))
            }
        })
    }
}
