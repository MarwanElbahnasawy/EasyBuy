import Foundation
import Apollo
@testable import EasyBuy

extension ProductDetailsMockNetworkManager: NetworkManagerProtocol {
    
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
    
    func queryProductDetails(completion: @escaping (Result<ProductDetails, Error>) -> Void) {
        jsonResponse = Data(ProductDetailsMockNetworkManager.productDetails.utf8)
        ProductDetailsMockNetworkManager.shared.queryGraphQLRequest(query: ProductDetailsQuery(
            productId: "gid://shopify/Product/8311139107123",
            imageFirst: 10,
            variantsFirst: 10
        ), responseModel: ProductDetails.self) { (result: Result<ProductDetails, Error>) in
            switch result {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
