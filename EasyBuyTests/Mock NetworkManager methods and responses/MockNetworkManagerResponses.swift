//
//  MockNetworkManagerResponses.swift
//  EasyBuy
//
//  Created by mo_fathy on 17/06/2023.
//

import Foundation
import Apollo
@testable import EasyBuy

class MockNetworkManager{
    static let shared: MockNetworkManager = .init()
    
    var jsonResponse: Data!
    
    lazy var _service: ApolloClient = {
        let store = ApolloStore()
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client, requestType: .storeFront)
        let url = URL(string: NetworkConstants.baseUrl)!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
    
    static let allProductsResponse = """
    {
        "products": {
          "__typename": "ProductConnection",
          "nodes": [
            {
              "__typename": "Product",
              "id": "gid://shopify/Product/8311139107123",
              "title": "VANS |AUTHENTIC | LO PRO | BURGANDY/WHITE",
              "tags": [
                "egnition-sample-data",
                "men",
                "sale",
                "summer",
                "vans"
              ],
              "description": "The forefather of the Vans family, the original Vans Authentic was introduced in 1966 and nearly 4 decades later is still going strong, its popularity extending from the original fans - skaters and surfers to all sorts. Now remodeled into a low top lace-up with a slim silhouette, the Vans Authentic Lo Pro features sturdy canvas uppers with lower sidewalls, metal eyelets, and low profile mini waffle outsoles for a lightweight feel.",
              "productType": "SHOES",
              "vendor": "VANS",
              "options": [
                {
                  "__typename": "ProductOption",
                  "name": "Size",
                  "values": [
                    "4",
                    "5",
                    "10"
                  ]
                },
                {
                  "__typename": "ProductOption",
                  "name": "Color",
                  "values": [
                    "burgandy"
                  ]
                }
              ],
              "variants": {
                "__typename": "ProductVariantConnection",
                "edges": [
                  {
                    "__typename": "ProductVariantEdge",
                    "node": {
                      "__typename": "ProductVariant",
                      "id": "gid://shopify/ProductVariant/45253508006195",
                      "title": "4 / burgandy",
                      "price": {
                        "__typename": "MoneyV2",
                        "amount": "29.0",
                        "currencyCode": "EGP"
                      },
                      "availableForSale": true
                    }
                  },
                  {
                    "__typename": "ProductVariantEdge",
                    "node": {
                      "__typename": "ProductVariant",
                      "id": "gid://shopify/ProductVariant/45253508038963",
                      "title": "5 / burgandy",
                      "price": {
                        "__typename": "MoneyV2",
                        "amount": "29.0",
                        "currencyCode": "EGP"
                      },
                      "availableForSale": true
                    }
                  },
                  {
                    "__typename": "ProductVariantEdge",
                    "node": {
                      "__typename": "ProductVariant",
                      "id": "gid://shopify/ProductVariant/45253508071731",
                      "title": "10 / burgandy",
                      "price": {
                        "__typename": "MoneyV2",
                        "amount": "29.0",
                        "currencyCode": "EGP"
                      },
                      "availableForSale": true
                    }
                  }
                ]
              },
              "featuredImage": {
                "__typename": "Image",
                "id": "gid://shopify/ProductImage/41348866081075",
                "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"
              },
              "images": {
                "__typename": "ImageConnection",
                "edges": [
                  {
                    "__typename": "ImageEdge",
                    "node": {
                      "__typename": "Image",
                      "id": "gid://shopify/ProductImage/41348866081075",
                      "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"
                    }
                  },
                  {
                    "__typename": "ImageEdge",
                    "node": {
                      "__typename": "Image",
                      "id": "gid://shopify/ProductImage/41348866113843",
                      "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/57a6013d4b24210dd35456e5890e9a2e.jpg?v=1685480862"
                    }
                  },
                  {
                    "__typename": "ImageEdge",
                    "node": {
                      "__typename": "Image",
                      "id": "gid://shopify/ProductImage/41348866146611",
                      "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/10835069b66a4a8ffc47febc6e88aee7.jpg?v=1685480862"
                    }
                  },
                  {
                    "__typename": "ImageEdge",
                    "node": {
                      "__typename": "Image",
                      "id": "gid://shopify/ProductImage/41348866179379",
                      "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/81ae3a034de733944fd314f6d27c844f.jpg?v=1685480862"
                    }
                  },
                  {
                    "__typename": "ImageEdge",
                    "node": {
                      "__typename": "Image",
                      "id": "gid://shopify/ProductImage/41348866212147",
                      "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/1580fdd3164d608c47a5d7d6eccbf4cc.jpg?v=1685480862"
                    }
                  }
                ]
              }
            }
          ]
        }
    }
    """
    
    static let allCollectionsResponse = """
{

    "collections": {
      "nodes": [
        {
          "id": "gid://shopify/Collection/447403131187",
          "image": null,
          "handle": "frontpage",
          "title": "Home page"
        },
        {
          "id": "gid://shopify/Collection/447403819315",
          "image": {
            "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/collections/a340ce89e0298e52c438ae79591e3284.jpg?v=1685481047"
          },
          "handle": "vans",
          "title": "VANS"
        },
        {
          "id": "gid://shopify/Collection/447403852083",
          "image": {
            "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/collections/97a3b1227876bf099d279fd38290e567.jpg?v=1685481048"
          },
          "handle": "adidas",
          "title": "ADIDAS"
        },
        {
          "id": "gid://shopify/Collection/447403884851",
          "image": {
            "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/collections/52e93c3a86b9b62e023e5977ab218302.png?v=1685481049"
          },
          "handle": "nike",
          "title": "NIKE"
        },
        {
          "id": "gid://shopify/Collection/447403917619",
          "image": {
            "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/collections/1651743658af793833e0a0d9cf6a9c5d.png?v=1685481050"
          },
          "handle": "converse",
          "title": "CONVERSE"
        }
      ]
    }
  
}
"""

}
