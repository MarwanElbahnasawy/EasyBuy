import Foundation

class LoginViewModel: ObservableObject {
    @Published var token: CustomerAccessTokenCreateData?

    func createAccessToken(newAccessTokenInput: CustomerAccessTokenCreateInput) {
        NetworkManager.shared.performGraphQLRequest(mutation: CustomerAccessTokenCreateMutation(input: newAccessTokenInput), responseModel: CreateCustomerAccessTokenResponse.self, completion: { result in
            switch result {
            case .success(let response):
                self.token = response.data
            case .failure(let error):
                print("Failed to create customer due to error: \(error.localizedDescription)")
            }
        })
    }
}
