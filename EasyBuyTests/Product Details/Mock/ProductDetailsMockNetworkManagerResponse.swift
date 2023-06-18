import Foundation
import Apollo
@testable import EasyBuy

class ProductDetailsMockNetworkManager{
    static let shared: ProductDetailsMockNetworkManager = .init()
    
    var jsonResponse: Data!
    
    lazy var _service: ApolloClient = {
        let store = ApolloStore()
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client, requestType: .storeFront)
        let url = URL(string: NetworkConstants.baseUrl)!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
    
    static let productDetails = """
{
  "data": {
    "product": {
      "id": "gid://shopify/Product/8311139107123",
      "title": "VANS |AUTHENTIC | LO PRO | BURGANDY/WHITE",
      "description": "The forefather of the Vans family, the original Vans Authentic was introduced in 1966 and nearly 4 decades later is still going strong, its popularity extending from the original fans - skaters and surfers to all sorts. Now remodeled into a low top lace-up with a slim silhouette, the Vans Authentic Lo Pro features sturdy canvas uppers with lower sidewalls, metal eyelets, and low profile mini waffle outsoles for a lightweight feel.",
      "productType": "SHOES",
      "vendor": "VANS",
      "options": [
        {
          "name": "Size",
          "values": [
            "4",
            "5",
            "10"
          ]
        },
        {
          "name": "Color",
          "values": [
            "burgandy"
          ]
        }
      ],
      "variants": {
        "edges": [
          {
            "node": {
              "id": "gid://shopify/ProductVariant/45253508006195",
              "title": "4 / burgandy",
              "quantityAvailable": 11,
              "price": {
                "amount": "29.0",
                "currencyCode": "EGP"
              },
              "availableForSale": true
            }
          },
          {
            "node": {
              "id": "gid://shopify/ProductVariant/45253508038963",
              "title": "5 / burgandy",
              "quantityAvailable": 15,
              "price": {
                "amount": "29.0",
                "currencyCode": "EGP"
              },
              "availableForSale": true
            }
          },
          {
            "node": {
              "id": "gid://shopify/ProductVariant/45253508071731",
              "title": "10 / burgandy",
              "quantityAvailable": 17,
              "price": {
                "amount": "29.0",
                "currencyCode": "EGP"
              },
              "availableForSale": true
            }
          }
        ]
      },
      "featuredImage": {
        "id": "gid://shopify/ProductImage/41348866081075",
        "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"
      },
      "images": {
        "edges": [
          {
            "node": {
              "id": "gid://shopify/ProductImage/41348866081075",
              "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"
            }
          },
          {
            "node": {
              "id": "gid://shopify/ProductImage/41348866113843",
              "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/57a6013d4b24210dd35456e5890e9a2e.jpg?v=1685480862"
            }
          },
          {
            "node": {
              "id": "gid://shopify/ProductImage/41348866146611",
              "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/10835069b66a4a8ffc47febc6e88aee7.jpg?v=1685480862"
            }
          },
          {
            "node": {
              "id": "gid://shopify/ProductImage/41348866179379",
              "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/81ae3a034de733944fd314f6d27c844f.jpg?v=1685480862"
            }
          },
          {
            "node": {
              "id": "gid://shopify/ProductImage/41348866212147",
              "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/1580fdd3164d608c47a5d7d6eccbf4cc.jpg?v=1685480862"
            }
          }
        ]
      }
    }
  }
}
"""

}
