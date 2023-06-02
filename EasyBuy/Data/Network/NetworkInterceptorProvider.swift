//
//  NetworkInterceptorProvider.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 02/06/2023.
//

import Apollo
import Foundation

class TokenInterceptor: ApolloInterceptor {
    
    let token: String?
    
    init(token: String) {
        self.token = token
    }
    
    enum TokenError: Error {
        case noToken
    }
    
    /// Helper function to add the token then move on to the next step
    private func addTokenAndProceed<Operation: GraphQLOperation>(
        token: String,
        to request: HTTPRequest<Operation>,
        chain: RequestChain,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            request.addHeader(name: NetworkConstants.keyStoreFrontAccessToken, value: NetworkConstants.valueStoreFrontAccessToken)
            request.addHeader(name: NetworkConstants.keyContentType, value: NetworkConstants.valueContentType)
            chain.proceedAsync(request: request,
                               response: response,
                               completion: completion)
        }
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            guard let token = token else {
                chain.handleErrorAsync(TokenError.noToken,
                                       request: request,
                                       response: response,
                                       completion: completion)
                return
            }
            
            self.addTokenAndProceed(token: token,
                                    to: request,
                                    chain: chain,
                                    response: response,
                                    completion: completion)
        }
}

struct NetworkInterceptorProvider: InterceptorProvider {

  private let store: ApolloStore
  private let client: URLSessionClient

    init(store: ApolloStore,
         client: URLSessionClient) {
    self.store = store
    self.client = client
  }

  func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
    return [
      CacheReadInterceptor(store: self.store),
      TokenInterceptor(token: NetworkConstants.valueStoreFrontAccessToken),
      NetworkFetchInterceptor(client: self.client),
      ResponseCodeInterceptor(),
      JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
      AutomaticPersistedQueryInterceptor(),
      CacheWriteInterceptor(store: self.store)
    ]
  }
}
