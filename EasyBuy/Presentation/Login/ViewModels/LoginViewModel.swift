import Foundation

class LoginViewModel: ObservableObject {
    @Published var token: CreateCustomerAccessTokenResponse?

    func createAccessToken(newAccessTokenInput: CustomerAccessTokenCreateInput) {
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: CustomerAccessTokenCreateMutation(input: newAccessTokenInput), responseModel: CreateCustomerAccessTokenResponse.self, completion: { result in
            switch result {
            case .success(let response):
                self.token = response
            case .failure(let error):
                print("Failed to create access token: \(error)")
            }
        })
    }
}
