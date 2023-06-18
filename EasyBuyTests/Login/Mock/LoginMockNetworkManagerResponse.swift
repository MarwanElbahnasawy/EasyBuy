import Foundation
import Apollo
@testable import EasyBuy

class LoginMockNetworkManager{
    static let shared: LoginMockNetworkManager = .init()
    
    var jsonResponse: Data!
    
    lazy var _service: ApolloClient = {
        let store = ApolloStore()
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client, requestType: .storeFront)
        let url = URL(string: NetworkConstants.baseUrl)!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
    
    static let customerAccessTokenCreate = """
{
  "data": {
    "customerAccessTokenCreate": {
      "customerAccessToken": {
        "accessToken": "87169899dfeebbd0b776e9d6c8d4aaf9"
      },
      "customerUserErrors": []
    }
  }
}
"""

}
