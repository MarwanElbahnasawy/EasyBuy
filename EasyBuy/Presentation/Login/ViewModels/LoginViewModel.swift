import Foundation

class LoginViewModel: ObservableObject {
    @Published var token: CustomerAccessTokenCreateData?

    func createAccessToken(newAccessTokenInput: CustomerAccessTokenCreateInput) {
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: CustomerAccessTokenCreateMutation(input: newAccessTokenInput), responseModel: CustomerAccessTokenCreateData.self, completion: { result in
            switch result {
            case .success(let response):
                self.token = response
                print("Success to create access token: \(response.customerAccessTokenCreate?.customerAccessToken?.accessToken ?? "")")
                UserDefaults.standard.set(response.customerAccessTokenCreate?.customerAccessToken?.accessToken, forKey: "accessToken")
            case .failure(let error):
                print("Failed to create access token: \(error)")
            }
        })
    }
}
