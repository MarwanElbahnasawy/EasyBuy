import Foundation
import Apollo
@testable import EasyBuy

class RegistrationMockNetworkManager {
    static let shared: RegistrationMockNetworkManager = .init()
    
    var jsonResponse: Data!
    
    lazy var _service: ApolloClient = {
        let store = ApolloStore()
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client, requestType: .storeFront)
        let url = URL(string: NetworkConstants.baseUrl)!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
    
    static let customerCreate = """
{
  "data": {
    "customerCreate": {
      "customer": {
        "id": "gid://shopify/Customer/7025725342003",
        "displayName": "Adham Omran",
        "email": "adhamo@shopify.com",
        "phone": "+12345678934"
      },
      "customerUserErrors": []
    }
  }
}
"""
    
}
