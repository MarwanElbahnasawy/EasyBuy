import Foundation
import Apollo

class ProductViewModel: ObservableObject {
    @Published var product: DataClass?
    var productId: GraphQLID?

    init(productId: GraphQLID?) {
        self.productId = productId
    }
    
    func fetchProductDetails() {
        guard let productId = productId else { return }
        let query = ProductDetailsQuery(productId: productId, imageFirst: 10, variantsFirst: 10)
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query: query, responseModel: DataClass.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.product = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
