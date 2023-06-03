//
//  NetworkManagerr.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 02/06/2023.
//

import Apollo
import Foundation

protocol NetworkManagerProtocol {
    
    var service: ApolloClient { get set }
    func queryGraphQLRequest<T: GraphQLQuery, K: Codable>(query: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void))
    func performGraphQLRequest<T: GraphQLMutation, K: Codable>(mutation: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void))
    
}

final class NetworkManager: NetworkManagerProtocol {
    
    var requestType: RequestType = .storeFront

    static var shared: NetworkManager?

    private init(requestType: RequestType) {
        self.requestType = requestType
    }
    static func getInstance(requestType: RequestType)-> NetworkManager{
        if shared == nil {
            shared = NetworkManager(requestType: requestType)
        }
        return shared!
       
    }
    
    private lazy var _service: ApolloClient = {
        let store = ApolloStore()
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client,requestType: requestType)
          var url : URL
          switch requestType {
          case .admin:
              url = URL(string: NetworkConstants.baseUrlAdmin)!
          case .storeFront:
              url = URL(string: NetworkConstants.baseUrl)!
          }
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store)
    }()
    
    var service: ApolloClient {
        get { return _service }
        set { _service = newValue }
    }
    
    func queryGraphQLRequest<T, K>(query: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void)) where T : Apollo.GraphQLQuery, K : Decodable, K : Encodable {
         

        NetworkManager.getInstance(requestType: requestType).service.fetch(query: query) { result in
             
             switch result {
             case .success(let apolloResponse):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: apolloResponse.data!.jsonObject, options: .fragmentsAllowed)
                      let decode = try JSONDecoder().decode(responseModel, from: data)
                        completion(.success(decode))
                    }catch (let error) {
                      print(error)
                    }
                  case .failure(let error):
                    print("Failure! Error: \(error)")
                 completion(.failure(error))
                  }
         }
     }
    func performGraphQLRequest<T, K>(mutation: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void)) where T : Apollo.GraphQLMutation, K : Decodable, K : Encodable {
        
        NetworkManager.getInstance(requestType: requestType).service.perform(mutation: mutation) { result in
            switch result {
            case .success(let apolloResponse):
                do {
                    let data = try JSONSerialization.data(withJSONObject: apolloResponse.data!.jsonObject, options: .fragmentsAllowed)
                  let decode = try JSONDecoder().decode(responseModel, from: data)
                    completion(.success(decode))
                }catch (let error) {
                  print(error)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
enum RequestType{
    case admin
    case storeFront
}
