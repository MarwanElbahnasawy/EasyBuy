import Foundation
import Apollo
@testable import EasyBuy

extension RegistrationMockNetworkManager: NetworkManagerProtocol {
    
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
    
    func mutationCustomerCreate(completion: @escaping (Result<CreateCustomerResponse, Error>) -> Void) {
        jsonResponse = Data(RegistrationMockNetworkManager.customerCreate.utf8)
        RegistrationMockNetworkManager.shared.performGraphQLRequest(mutation: CreateNewCustomerMutation(input: CustomerCreateInput(firstName: "Adham", lastName: "Omran", email: "adhamo@shopify.com", phone: "+12345678934", password: "5hopify", acceptsMarketing: true)), responseModel: CreateCustomerResponse.self) { (result: Result<CreateCustomerResponse, Error>) in
            switch result {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

