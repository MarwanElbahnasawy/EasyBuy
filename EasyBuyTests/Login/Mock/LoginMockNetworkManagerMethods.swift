import Foundation
import Apollo
@testable import EasyBuy

extension LoginMockNetworkManager: NetworkManagerProtocol {
    
    var service: ApolloClient {
        get { return _service }
        set { _service = newValue }
    }
    
    func queryGraphQLRequest<T, K>(query: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void)) where T : Apollo.GraphQLQuery, K : Decodable, K : Encodable {
        do {
            let decodedData = try JSONDecoder().decode(K.self, from: jsonResponse)
            completion(.success(decodedData))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func performGraphQLRequest<T, K>(mutation: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void)) where T : Apollo.GraphQLMutation, K : Decodable, K : Encodable {
        
    }
    
    func mutationCustomerAccessTokenCreate(completion: @escaping (Result<CreateCustomerAccessTokenResponse, Error>) -> Void) {
        jsonResponse = Data(LoginMockNetworkManager.customerAccessTokenCreate.utf8)
        LoginMockNetworkManager.shared.performGraphQLRequest(mutation: CustomerAccessTokenCreateMutation(input: CustomerAccessTokenCreateInput(email: "marwan@gmail.com", password: "123456")), responseModel: CreateCustomerAccessTokenResponse.self) { (result: Result<CreateCustomerAccessTokenResponse, Error>) in
            switch result {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

