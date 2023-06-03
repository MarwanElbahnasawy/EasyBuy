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
      let requestType: RequestType
      
      init(token: String, requestType: RequestType) {
          self.token = token
          self.requestType = requestType
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
            
            switch requestType {
                   case .admin:
                       request.addHeader(name: NetworkConstants.keyAccessToken, value: NetworkConstants.valueAccessToken)
                   case .storeFront:
                       request.addHeader(name: NetworkConstants.keyStoreFrontAccessToken, value: NetworkConstants.valueStoreFrontAccessToken)
                   }

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
    private let requestType: RequestType

    init(store: ApolloStore,
         client: URLSessionClient,requestType: RequestType) {
    self.store = store
    self.client = client
    self.requestType = requestType
  }

  func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
      switch requestType {
          case .admin:
              return [
                CacheReadInterceptor(store: self.store),
                TokenInterceptor(token: NetworkConstants.valueAccessToken, requestType: requestType),
                NetworkFetchInterceptor(client: self.client),
                ResponseCodeInterceptor(),
                JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
                AutomaticPersistedQueryInterceptor(),
                CacheWriteInterceptor(store: self.store)
              ]
          case .storeFront:
              return [
                CacheReadInterceptor(store: self.store),
                TokenInterceptor(token: NetworkConstants.valueStoreFrontAccessToken, requestType: requestType),
                NetworkFetchInterceptor(client: self.client),
                ResponseCodeInterceptor(),
                JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
                AutomaticPersistedQueryInterceptor(),
                CacheWriteInterceptor(store: self.store)
              ]
          }
  }
}
