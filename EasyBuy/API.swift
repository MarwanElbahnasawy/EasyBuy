// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// The three-letter currency codes that represent the world currencies used in stores. These include standard ISO 4217 codes, legacy codes,
/// and non-standard codes.

/// The input fields to create a new customer.
public struct CustomerCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - firstName: The customer’s first name.
  ///   - lastName: The customer’s last name.
  ///   - email: The customer’s email.
  ///   - phone: A unique phone number for the customer.
  ///
  /// Formatted using E.164 standard. For example, _+16135551111_.
  ///   - password: The login password used by the customer.
  ///   - acceptsMarketing: Indicates whether the customer has consented to be sent marketing material via email.
  public init(firstName: Swift.Optional<String?> = nil, lastName: Swift.Optional<String?> = nil, email: String, phone: Swift.Optional<String?> = nil, password: String, acceptsMarketing: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "password": password, "acceptsMarketing": acceptsMarketing]
  }

  /// The customer’s first name.
  public var firstName: Swift.Optional<String?> {
    get {
      return graphQLMap["firstName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  /// The customer’s last name.
  public var lastName: Swift.Optional<String?> {
    get {
      return graphQLMap["lastName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  /// The customer’s email.
  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  /// A unique phone number for the customer.
  ///
  /// Formatted using E.164 standard. For example, _+16135551111_.
  public var phone: Swift.Optional<String?> {
    get {
      return graphQLMap["phone"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phone")
    }
  }

  /// The login password used by the customer.
  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  /// Indicates whether the customer has consented to be sent marketing material via email.
  public var acceptsMarketing: Swift.Optional<Bool?> {
    get {
      return graphQLMap["acceptsMarketing"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "acceptsMarketing")
    }
  }
}

/// Possible error codes that can be returned by `CustomerUserError`.
public enum CustomerErrorCode: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// The input value is blank.
  case blank
  /// The input value is invalid.
  case invalid
  /// The input value is already taken.
  case taken
  /// The input value is too long.
  case tooLong
  /// The input value is too short.
  case tooShort
  /// Unidentified customer.
  case unidentifiedCustomer
  /// Customer is disabled.
  case customerDisabled
  /// Input password starts or ends with whitespace.
  case passwordStartsOrEndsWithWhitespace
  /// Input contains HTML tags.
  case containsHtmlTags
  /// Input contains URL.
  case containsUrl
  /// Invalid activation token.
  case tokenInvalid
  /// Customer already enabled.
  case alreadyEnabled
  /// Address does not exist.
  case notFound
  /// Input email contains an invalid domain name.
  case badDomain
  /// Multipass token is not valid.
  case invalidMultipassRequest
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "BLANK": self = .blank
      case "INVALID": self = .invalid
      case "TAKEN": self = .taken
      case "TOO_LONG": self = .tooLong
      case "TOO_SHORT": self = .tooShort
      case "UNIDENTIFIED_CUSTOMER": self = .unidentifiedCustomer
      case "CUSTOMER_DISABLED": self = .customerDisabled
      case "PASSWORD_STARTS_OR_ENDS_WITH_WHITESPACE": self = .passwordStartsOrEndsWithWhitespace
      case "CONTAINS_HTML_TAGS": self = .containsHtmlTags
      case "CONTAINS_URL": self = .containsUrl
      case "TOKEN_INVALID": self = .tokenInvalid
      case "ALREADY_ENABLED": self = .alreadyEnabled
      case "NOT_FOUND": self = .notFound
      case "BAD_DOMAIN": self = .badDomain
      case "INVALID_MULTIPASS_REQUEST": self = .invalidMultipassRequest
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .blank: return "BLANK"
      case .invalid: return "INVALID"
      case .taken: return "TAKEN"
      case .tooLong: return "TOO_LONG"
      case .tooShort: return "TOO_SHORT"
      case .unidentifiedCustomer: return "UNIDENTIFIED_CUSTOMER"
      case .customerDisabled: return "CUSTOMER_DISABLED"
      case .passwordStartsOrEndsWithWhitespace: return "PASSWORD_STARTS_OR_ENDS_WITH_WHITESPACE"
      case .containsHtmlTags: return "CONTAINS_HTML_TAGS"
      case .containsUrl: return "CONTAINS_URL"
      case .tokenInvalid: return "TOKEN_INVALID"
      case .alreadyEnabled: return "ALREADY_ENABLED"
      case .notFound: return "NOT_FOUND"
      case .badDomain: return "BAD_DOMAIN"
      case .invalidMultipassRequest: return "INVALID_MULTIPASS_REQUEST"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CustomerErrorCode, rhs: CustomerErrorCode) -> Bool {
    switch (lhs, rhs) {
      case (.blank, .blank): return true
      case (.invalid, .invalid): return true
      case (.taken, .taken): return true
      case (.tooLong, .tooLong): return true
      case (.tooShort, .tooShort): return true
      case (.unidentifiedCustomer, .unidentifiedCustomer): return true
      case (.customerDisabled, .customerDisabled): return true
      case (.passwordStartsOrEndsWithWhitespace, .passwordStartsOrEndsWithWhitespace): return true
      case (.containsHtmlTags, .containsHtmlTags): return true
      case (.containsUrl, .containsUrl): return true
      case (.tokenInvalid, .tokenInvalid): return true
      case (.alreadyEnabled, .alreadyEnabled): return true
      case (.notFound, .notFound): return true
      case (.badDomain, .badDomain): return true
      case (.invalidMultipassRequest, .invalidMultipassRequest): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CustomerErrorCode] {
    return [
      .blank,
      .invalid,
      .taken,
      .tooLong,
      .tooShort,
      .unidentifiedCustomer,
      .customerDisabled,
      .passwordStartsOrEndsWithWhitespace,
      .containsHtmlTags,
      .containsUrl,
      .tokenInvalid,
      .alreadyEnabled,
      .notFound,
      .badDomain,
      .invalidMultipassRequest,
    ]
  }
}

/// The input fields required to create a customer access token.
public struct CustomerAccessTokenCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email: The email associated to the customer.
  ///   - password: The login password to be used by the customer.
  public init(email: String, password: String) {
    graphQLMap = ["email": email, "password": password]
  }

  /// The email associated to the customer.
  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  /// The login password to be used by the customer.
  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public final class ProductDetailsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ProductDetails($productId: ID, $imageFirst: Int, $variantsFirst: Int) {
      product(id: $productId) {
        __typename
        id
        title
        description
        productType
        vendor
        options {
          __typename
          name
          values
        }
        variants(first: $variantsFirst) {
          __typename
          edges {
            __typename
            node {
              __typename
              id
              title
              price {
                __typename
                amount
                currencyCode
              }
              availableForSale
            }
          }
        }
        featuredImage {
          __typename
          id
          url
        }
        images(first: $imageFirst) {
          __typename
          edges {
            __typename
            node {
              __typename
              id
              url
            }
          }
        }
      }
    }
    """

  public let operationName: String = "ProductDetails"

  public var productId: GraphQLID?
  public var imageFirst: Int?
  public var variantsFirst: Int?

  public init(productId: GraphQLID? = nil, imageFirst: Int? = nil, variantsFirst: Int? = nil) {
    self.productId = productId
    self.imageFirst = imageFirst
    self.variantsFirst = variantsFirst
  }

  public var variables: GraphQLMap? {
    return ["productId": productId, "imageFirst": imageFirst, "variantsFirst": variantsFirst]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["QueryRoot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("product", arguments: ["id": GraphQLVariable("productId")], type: .object(Product.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(product: Product? = nil) {
      self.init(unsafeResultMap: ["__typename": "QueryRoot", "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
    }

    /// Fetch a specific `Product` by one of its unique attributes.
    public var product: Product? {
      get {
        return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "product")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("productType", type: .nonNull(.scalar(String.self))),
          GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
          GraphQLField("options", type: .nonNull(.list(.nonNull(.object(Option.selections))))),
          GraphQLField("variants", arguments: ["first": GraphQLVariable("variantsFirst")], type: .nonNull(.object(Variant.selections))),
          GraphQLField("featuredImage", type: .object(FeaturedImage.selections)),
          GraphQLField("images", arguments: ["first": GraphQLVariable("imageFirst")], type: .nonNull(.object(Image.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, description: String, productType: String, vendor: String, options: [Option], variants: Variant, featuredImage: FeaturedImage? = nil, images: Image) {
        self.init(unsafeResultMap: ["__typename": "Product", "id": id, "title": title, "description": description, "productType": productType, "vendor": vendor, "options": options.map { (value: Option) -> ResultMap in value.resultMap }, "variants": variants.resultMap, "featuredImage": featuredImage.flatMap { (value: FeaturedImage) -> ResultMap in value.resultMap }, "images": images.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A globally-unique ID.
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The product’s title.
      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// Stripped description of the product, single line with HTML tags removed.
      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// A categorization that a product can be tagged with, commonly used for filtering and searching.
      public var productType: String {
        get {
          return resultMap["productType"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "productType")
        }
      }

      /// The product’s vendor name.
      public var vendor: String {
        get {
          return resultMap["vendor"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "vendor")
        }
      }

      /// List of product options.
      public var options: [Option] {
        get {
          return (resultMap["options"] as! [ResultMap]).map { (value: ResultMap) -> Option in Option(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Option) -> ResultMap in value.resultMap }, forKey: "options")
        }
      }

      /// List of the product’s variants.
      public var variants: Variant {
        get {
          return Variant(unsafeResultMap: resultMap["variants"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "variants")
        }
      }

      /// The featured image for the product.
      ///
      /// This field is functionally equivalent to `images(first: 1)`.
      public var featuredImage: FeaturedImage? {
        get {
          return (resultMap["featuredImage"] as? ResultMap).flatMap { FeaturedImage(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "featuredImage")
        }
      }

      /// List of images associated with the product.
      public var images: Image {
        get {
          return Image(unsafeResultMap: resultMap["images"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "images")
        }
      }

      public struct Option: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductOption"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("values", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, values: [String]) {
          self.init(unsafeResultMap: ["__typename": "ProductOption", "name": name, "values": values])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The product option’s name.
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The corresponding value to the product option name.
        public var values: [String] {
          get {
            return resultMap["values"]! as! [String]
          }
          set {
            resultMap.updateValue(newValue, forKey: "values")
          }
        }
      }

      public struct Variant: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductVariantConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge]) {
          self.init(unsafeResultMap: ["__typename": "ProductVariantConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge] {
          get {
            return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductVariantEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .nonNull(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node) {
            self.init(unsafeResultMap: ["__typename": "ProductVariantEdge", "node": node.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of ProductVariantEdge.
          public var node: Node {
            get {
              return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProductVariant"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("price", type: .nonNull(.object(Price.selections))),
                GraphQLField("availableForSale", type: .nonNull(.scalar(Bool.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, title: String, price: Price, availableForSale: Bool) {
              self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "title": title, "price": price.resultMap, "availableForSale": availableForSale])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A globally-unique ID.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The product variant’s title.
            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            /// The product variant’s price.
            public var price: Price {
              get {
                return Price(unsafeResultMap: resultMap["price"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "price")
              }
            }

            /// Indicates if the product variant is available for sale.
            public var availableForSale: Bool {
              get {
                return resultMap["availableForSale"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "availableForSale")
              }
            }

            public struct Price: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MoneyV2"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("amount", type: .nonNull(.scalar(String.self))),
                  GraphQLField("currencyCode", type: .nonNull(.scalar(CurrencyCode.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(amount: String, currencyCode: CurrencyCode) {
                self.init(unsafeResultMap: ["__typename": "MoneyV2", "amount": amount, "currencyCode": currencyCode])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Decimal money amount.
              public var amount: String {
                get {
                  return resultMap["amount"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "amount")
                }
              }

              /// Currency of the money.
              public var currencyCode: CurrencyCode {
                get {
                  return resultMap["currencyCode"]! as! CurrencyCode
                }
                set {
                  resultMap.updateValue(newValue, forKey: "currencyCode")
                }
              }
            }
          }
        }
      }

      public struct FeaturedImage: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, url: String) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "url": url])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A unique ID for the image.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The location of the image as a URL.
        ///
        /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
        ///
        /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
        ///
        /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ImageConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge]) {
          self.init(unsafeResultMap: ["__typename": "ImageConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge] {
          get {
            return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ImageEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .nonNull(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node) {
            self.init(unsafeResultMap: ["__typename": "ImageEdge", "node": node.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of ImageEdge.
          public var node: Node {
            get {
              return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Image"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(GraphQLID.self)),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID? = nil, url: String) {
              self.init(unsafeResultMap: ["__typename": "Image", "id": id, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A unique ID for the image.
            public var id: GraphQLID? {
              get {
                return resultMap["id"] as? GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The location of the image as a URL.
            ///
            /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
            ///
            /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
            ///
            /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }
        }
      }
    }
  }
}

public final class CollectionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Collections($first: Int) {
      collections(first: $first) {
        __typename
        nodes {
          __typename
          id
          image {
            __typename
            url
          }
          handle
          title
        }
      }
    }
    """

  public let operationName: String = "Collections"

  public var first: Int?

  public init(first: Int? = nil) {
    self.first = first
  }

  public var variables: GraphQLMap? {
    return ["first": first]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["QueryRoot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("collections", arguments: ["first": GraphQLVariable("first")], type: .nonNull(.object(Collection.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(collections: Collection) {
      self.init(unsafeResultMap: ["__typename": "QueryRoot", "collections": collections.resultMap])
    }

    /// List of the shop’s collections.
    public var collections: Collection {
      get {
        return Collection(unsafeResultMap: resultMap["collections"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "collections")
      }
    }

    public struct Collection: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CollectionConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node]) {
        self.init(unsafeResultMap: ["__typename": "CollectionConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of the nodes contained in CollectionEdge.
      public var nodes: [Node] {
        get {
          return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Collection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("image", type: .object(Image.selections)),
            GraphQLField("handle", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, image: Image? = nil, handle: String, title: String) {
          self.init(unsafeResultMap: ["__typename": "Collection", "id": id, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "handle": handle, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A globally-unique ID.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// Image associated with the collection.
        public var image: Image? {
          get {
            return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "image")
          }
        }

        /// A human-friendly unique string for the collection automatically generated from its title.
        /// Limit of 255 characters.
        public var handle: String {
          get {
            return resultMap["handle"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "handle")
          }
        }

        /// The collection’s name. Limit of 255 characters.
        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Image"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(url: String) {
            self.init(unsafeResultMap: ["__typename": "Image", "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The location of the image as a URL.
          ///
          /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
          ///
          /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
          ///
          /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }
      }
    }
  }
}

public final class GetAllProductsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllProducts($first: Int, $imageFirst: Int, $variantsFirst: Int) {
      products(first: $first) {
        __typename
        nodes {
          __typename
          id
          title
          tags
          description
          productType
          vendor
          options {
            __typename
            name
            values
          }
          variants(first: $variantsFirst) {
            __typename
            edges {
              __typename
              node {
                __typename
                id
                title
                price {
                  __typename
                  amount
                  currencyCode
                }
                availableForSale
              }
            }
          }
          featuredImage {
            __typename
            id
            url
          }
          images(first: $imageFirst) {
            __typename
            edges {
              __typename
              node {
                __typename
                id
                url
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetAllProducts"

  public var first: Int?
  public var imageFirst: Int?
  public var variantsFirst: Int?

  public init(first: Int? = nil, imageFirst: Int? = nil, variantsFirst: Int? = nil) {
    self.first = first
    self.imageFirst = imageFirst
    self.variantsFirst = variantsFirst
  }

  public var variables: GraphQLMap? {
    return ["first": first, "imageFirst": imageFirst, "variantsFirst": variantsFirst]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["QueryRoot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("products", arguments: ["first": GraphQLVariable("first")], type: .nonNull(.object(Product.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(products: Product) {
      self.init(unsafeResultMap: ["__typename": "QueryRoot", "products": products.resultMap])
    }

    /// List of the shop’s products.
    public var products: Product {
      get {
        return Product(unsafeResultMap: resultMap["products"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node]) {
        self.init(unsafeResultMap: ["__typename": "ProductConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of the nodes contained in ProductEdge.
      public var nodes: [Node] {
        get {
          return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Product"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("tags", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("productType", type: .nonNull(.scalar(String.self))),
            GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
            GraphQLField("options", type: .nonNull(.list(.nonNull(.object(Option.selections))))),
            GraphQLField("variants", arguments: ["first": GraphQLVariable("variantsFirst")], type: .nonNull(.object(Variant.selections))),
            GraphQLField("featuredImage", type: .object(FeaturedImage.selections)),
            GraphQLField("images", arguments: ["first": GraphQLVariable("imageFirst")], type: .nonNull(.object(Image.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String, tags: [String], description: String, productType: String, vendor: String, options: [Option], variants: Variant, featuredImage: FeaturedImage? = nil, images: Image) {
          self.init(unsafeResultMap: ["__typename": "Product", "id": id, "title": title, "tags": tags, "description": description, "productType": productType, "vendor": vendor, "options": options.map { (value: Option) -> ResultMap in value.resultMap }, "variants": variants.resultMap, "featuredImage": featuredImage.flatMap { (value: FeaturedImage) -> ResultMap in value.resultMap }, "images": images.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A globally-unique ID.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The product’s title.
        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// A comma separated list of tags that have been added to the product.
        /// Additional access scope required for private apps: unauthenticated_read_product_tags.
        public var tags: [String] {
          get {
            return resultMap["tags"]! as! [String]
          }
          set {
            resultMap.updateValue(newValue, forKey: "tags")
          }
        }

        /// Stripped description of the product, single line with HTML tags removed.
        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        /// A categorization that a product can be tagged with, commonly used for filtering and searching.
        public var productType: String {
          get {
            return resultMap["productType"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "productType")
          }
        }

        /// The product’s vendor name.
        public var vendor: String {
          get {
            return resultMap["vendor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "vendor")
          }
        }

        /// List of product options.
        public var options: [Option] {
          get {
            return (resultMap["options"] as! [ResultMap]).map { (value: ResultMap) -> Option in Option(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Option) -> ResultMap in value.resultMap }, forKey: "options")
          }
        }

        /// List of the product’s variants.
        public var variants: Variant {
          get {
            return Variant(unsafeResultMap: resultMap["variants"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "variants")
          }
        }

        /// The featured image for the product.
        ///
        /// This field is functionally equivalent to `images(first: 1)`.
        public var featuredImage: FeaturedImage? {
          get {
            return (resultMap["featuredImage"] as? ResultMap).flatMap { FeaturedImage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "featuredImage")
          }
        }

        /// List of images associated with the product.
        public var images: Image {
          get {
            return Image(unsafeResultMap: resultMap["images"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "images")
          }
        }

        public struct Option: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductOption"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("values", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, values: [String]) {
            self.init(unsafeResultMap: ["__typename": "ProductOption", "name": name, "values": values])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The product option’s name.
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The corresponding value to the product option name.
          public var values: [String] {
            get {
              return resultMap["values"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "values")
            }
          }
        }

        public struct Variant: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductVariantConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(edges: [Edge]) {
            self.init(unsafeResultMap: ["__typename": "ProductVariantConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of edges.
          public var edges: [Edge] {
            get {
              return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
            }
          }

          public struct Edge: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProductVariantEdge"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(node: Node) {
              self.init(unsafeResultMap: ["__typename": "ProductVariantEdge", "node": node.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The item at the end of ProductVariantEdge.
            public var node: Node {
              get {
                return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "node")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ProductVariant"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("title", type: .nonNull(.scalar(String.self))),
                  GraphQLField("price", type: .nonNull(.object(Price.selections))),
                  GraphQLField("availableForSale", type: .nonNull(.scalar(Bool.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, title: String, price: Price, availableForSale: Bool) {
                self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "title": title, "price": price.resultMap, "availableForSale": availableForSale])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A globally-unique ID.
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The product variant’s title.
              public var title: String {
                get {
                  return resultMap["title"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "title")
                }
              }

              /// The product variant’s price.
              public var price: Price {
                get {
                  return Price(unsafeResultMap: resultMap["price"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "price")
                }
              }

              /// Indicates if the product variant is available for sale.
              public var availableForSale: Bool {
                get {
                  return resultMap["availableForSale"]! as! Bool
                }
                set {
                  resultMap.updateValue(newValue, forKey: "availableForSale")
                }
              }

              public struct Price: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["MoneyV2"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("amount", type: .nonNull(.scalar(String.self))),
                    GraphQLField("currencyCode", type: .nonNull(.scalar(CurrencyCode.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(amount: String, currencyCode: CurrencyCode) {
                  self.init(unsafeResultMap: ["__typename": "MoneyV2", "amount": amount, "currencyCode": currencyCode])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Decimal money amount.
                public var amount: String {
                  get {
                    return resultMap["amount"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "amount")
                  }
                }

                /// Currency of the money.
                public var currencyCode: CurrencyCode {
                  get {
                    return resultMap["currencyCode"]! as! CurrencyCode
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "currencyCode")
                  }
                }
              }
            }
          }
        }

        public struct FeaturedImage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Image"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, url: String) {
            self.init(unsafeResultMap: ["__typename": "Image", "id": id, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A unique ID for the image.
          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The location of the image as a URL.
          ///
          /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
          ///
          /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
          ///
          /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ImageConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(edges: [Edge]) {
            self.init(unsafeResultMap: ["__typename": "ImageConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of edges.
          public var edges: [Edge] {
            get {
              return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
            }
          }

          public struct Edge: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ImageEdge"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(node: Node) {
              self.init(unsafeResultMap: ["__typename": "ImageEdge", "node": node.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The item at the end of ImageEdge.
            public var node: Node {
              get {
                return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "node")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Image"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .scalar(GraphQLID.self)),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID? = nil, url: String) {
                self.init(unsafeResultMap: ["__typename": "Image", "id": id, "url": url])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A unique ID for the image.
              public var id: GraphQLID? {
                get {
                  return resultMap["id"] as? GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The location of the image as a URL.
              ///
              /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
              ///
              /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
              ///
              /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class CollectionProductsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CollectionProducts($handle: String, $first: Int, $imageFirst: Int, $variantsFirst: Int) {
      collection(handle: $handle) {
        __typename
        description
        products(first: $first) {
          __typename
          nodes {
            __typename
            id
            title
            tags
            description
            productType
            vendor
            options {
              __typename
              name
              values
            }
            variants(first: $variantsFirst) {
              __typename
              edges {
                __typename
                node {
                  __typename
                  id
                  title
                  price {
                    __typename
                    amount
                    currencyCode
                  }
                  availableForSale
                }
              }
            }
            featuredImage {
              __typename
              id
              url
            }
            images(first: $imageFirst) {
              __typename
              edges {
                __typename
                node {
                  __typename
                  id
                  url
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "CollectionProducts"

  public var handle: String?
  public var first: Int?
  public var imageFirst: Int?
  public var variantsFirst: Int?

  public init(handle: String? = nil, first: Int? = nil, imageFirst: Int? = nil, variantsFirst: Int? = nil) {
    self.handle = handle
    self.first = first
    self.imageFirst = imageFirst
    self.variantsFirst = variantsFirst
  }

  public var variables: GraphQLMap? {
    return ["handle": handle, "first": first, "imageFirst": imageFirst, "variantsFirst": variantsFirst]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["QueryRoot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("collection", arguments: ["handle": GraphQLVariable("handle")], type: .object(Collection.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(collection: Collection? = nil) {
      self.init(unsafeResultMap: ["__typename": "QueryRoot", "collection": collection.flatMap { (value: Collection) -> ResultMap in value.resultMap }])
    }

    /// Fetch a specific `Collection` by one of its unique attributes.
    public var collection: Collection? {
      get {
        return (resultMap["collection"] as? ResultMap).flatMap { Collection(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "collection")
      }
    }

    public struct Collection: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Collection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("products", arguments: ["first": GraphQLVariable("first")], type: .nonNull(.object(Product.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(description: String, products: Product) {
        self.init(unsafeResultMap: ["__typename": "Collection", "description": description, "products": products.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Stripped description of the collection, single line with HTML tags removed.
      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// List of products in the collection.
      public var products: Product {
        get {
          return Product(unsafeResultMap: resultMap["products"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "products")
        }
      }

      public struct Product: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node]) {
          self.init(unsafeResultMap: ["__typename": "ProductConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of the nodes contained in ProductEdge.
        public var nodes: [Node] {
          get {
            return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Product"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("tags", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
              GraphQLField("description", type: .nonNull(.scalar(String.self))),
              GraphQLField("productType", type: .nonNull(.scalar(String.self))),
              GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
              GraphQLField("options", type: .nonNull(.list(.nonNull(.object(Option.selections))))),
              GraphQLField("variants", arguments: ["first": GraphQLVariable("variantsFirst")], type: .nonNull(.object(Variant.selections))),
              GraphQLField("featuredImage", type: .object(FeaturedImage.selections)),
              GraphQLField("images", arguments: ["first": GraphQLVariable("imageFirst")], type: .nonNull(.object(Image.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, title: String, tags: [String], description: String, productType: String, vendor: String, options: [Option], variants: Variant, featuredImage: FeaturedImage? = nil, images: Image) {
            self.init(unsafeResultMap: ["__typename": "Product", "id": id, "title": title, "tags": tags, "description": description, "productType": productType, "vendor": vendor, "options": options.map { (value: Option) -> ResultMap in value.resultMap }, "variants": variants.resultMap, "featuredImage": featuredImage.flatMap { (value: FeaturedImage) -> ResultMap in value.resultMap }, "images": images.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A globally-unique ID.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The product’s title.
          public var title: String {
            get {
              return resultMap["title"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          /// A comma separated list of tags that have been added to the product.
          /// Additional access scope required for private apps: unauthenticated_read_product_tags.
          public var tags: [String] {
            get {
              return resultMap["tags"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "tags")
            }
          }

          /// Stripped description of the product, single line with HTML tags removed.
          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// A categorization that a product can be tagged with, commonly used for filtering and searching.
          public var productType: String {
            get {
              return resultMap["productType"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "productType")
            }
          }

          /// The product’s vendor name.
          public var vendor: String {
            get {
              return resultMap["vendor"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "vendor")
            }
          }

          /// List of product options.
          public var options: [Option] {
            get {
              return (resultMap["options"] as! [ResultMap]).map { (value: ResultMap) -> Option in Option(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Option) -> ResultMap in value.resultMap }, forKey: "options")
            }
          }

          /// List of the product’s variants.
          public var variants: Variant {
            get {
              return Variant(unsafeResultMap: resultMap["variants"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "variants")
            }
          }

          /// The featured image for the product.
          ///
          /// This field is functionally equivalent to `images(first: 1)`.
          public var featuredImage: FeaturedImage? {
            get {
              return (resultMap["featuredImage"] as? ResultMap).flatMap { FeaturedImage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "featuredImage")
            }
          }

          /// List of images associated with the product.
          public var images: Image {
            get {
              return Image(unsafeResultMap: resultMap["images"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "images")
            }
          }

          public struct Option: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProductOption"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("values", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, values: [String]) {
              self.init(unsafeResultMap: ["__typename": "ProductOption", "name": name, "values": values])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The product option’s name.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The corresponding value to the product option name.
            public var values: [String] {
              get {
                return resultMap["values"]! as! [String]
              }
              set {
                resultMap.updateValue(newValue, forKey: "values")
              }
            }
          }

          public struct Variant: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProductVariantConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(edges: [Edge]) {
              self.init(unsafeResultMap: ["__typename": "ProductVariantConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of edges.
            public var edges: [Edge] {
              get {
                return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
              }
            }

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ProductVariantEdge"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .nonNull(.object(Node.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(node: Node) {
                self.init(unsafeResultMap: ["__typename": "ProductVariantEdge", "node": node.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The item at the end of ProductVariantEdge.
              public var node: Node {
                get {
                  return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "node")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["ProductVariant"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("title", type: .nonNull(.scalar(String.self))),
                    GraphQLField("price", type: .nonNull(.object(Price.selections))),
                    GraphQLField("availableForSale", type: .nonNull(.scalar(Bool.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: GraphQLID, title: String, price: Price, availableForSale: Bool) {
                  self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "title": title, "price": price.resultMap, "availableForSale": availableForSale])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// A globally-unique ID.
                public var id: GraphQLID {
                  get {
                    return resultMap["id"]! as! GraphQLID
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }

                /// The product variant’s title.
                public var title: String {
                  get {
                    return resultMap["title"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "title")
                  }
                }

                /// The product variant’s price.
                public var price: Price {
                  get {
                    return Price(unsafeResultMap: resultMap["price"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "price")
                  }
                }

                /// Indicates if the product variant is available for sale.
                public var availableForSale: Bool {
                  get {
                    return resultMap["availableForSale"]! as! Bool
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "availableForSale")
                  }
                }

                public struct Price: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["MoneyV2"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("amount", type: .nonNull(.scalar(String.self))),
                      GraphQLField("currencyCode", type: .nonNull(.scalar(CurrencyCode.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(amount: String, currencyCode: CurrencyCode) {
                    self.init(unsafeResultMap: ["__typename": "MoneyV2", "amount": amount, "currencyCode": currencyCode])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Decimal money amount.
                  public var amount: String {
                    get {
                      return resultMap["amount"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "amount")
                    }
                  }

                  /// Currency of the money.
                  public var currencyCode: CurrencyCode {
                    get {
                      return resultMap["currencyCode"]! as! CurrencyCode
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "currencyCode")
                    }
                  }
                }
              }
            }
          }

          public struct FeaturedImage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Image"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(GraphQLID.self)),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID? = nil, url: String) {
              self.init(unsafeResultMap: ["__typename": "Image", "id": id, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A unique ID for the image.
            public var id: GraphQLID? {
              get {
                return resultMap["id"] as? GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The location of the image as a URL.
            ///
            /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
            ///
            /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
            ///
            /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }

          public struct Image: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ImageConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(edges: [Edge]) {
              self.init(unsafeResultMap: ["__typename": "ImageConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of edges.
            public var edges: [Edge] {
              get {
                return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
              }
            }

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ImageEdge"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .nonNull(.object(Node.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(node: Node) {
                self.init(unsafeResultMap: ["__typename": "ImageEdge", "node": node.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The item at the end of ImageEdge.
              public var node: Node {
                get {
                  return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "node")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Image"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .scalar(GraphQLID.self)),
                    GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: GraphQLID? = nil, url: String) {
                  self.init(unsafeResultMap: ["__typename": "Image", "id": id, "url": url])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// A unique ID for the image.
                public var id: GraphQLID? {
                  get {
                    return resultMap["id"] as? GraphQLID
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }

                /// The location of the image as a URL.
                ///
                /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                ///
                /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                ///
                /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                public var url: String {
                  get {
                    return resultMap["url"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "url")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class CreateNewCustomerMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateNewCustomer($input: CustomerCreateInput!) {
      customerCreate(input: $input) {
        __typename
        customer {
          __typename
          id
          displayName
          email
          phone
        }
        customerUserErrors {
          __typename
          code
          field
          message
        }
      }
    }
    """

  public let operationName: String = "CreateNewCustomer"

  public var input: CustomerCreateInput

  public init(input: CustomerCreateInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("customerCreate", arguments: ["input": GraphQLVariable("input")], type: .object(CustomerCreate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(customerCreate: CustomerCreate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "customerCreate": customerCreate.flatMap { (value: CustomerCreate) -> ResultMap in value.resultMap }])
    }

    /// Creates a new customer.
    public var customerCreate: CustomerCreate? {
      get {
        return (resultMap["customerCreate"] as? ResultMap).flatMap { CustomerCreate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "customerCreate")
      }
    }

    public struct CustomerCreate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CustomerCreatePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("customer", type: .object(Customer.selections)),
          GraphQLField("customerUserErrors", type: .nonNull(.list(.nonNull(.object(CustomerUserError.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(customer: Customer? = nil, customerUserErrors: [CustomerUserError]) {
        self.init(unsafeResultMap: ["__typename": "CustomerCreatePayload", "customer": customer.flatMap { (value: Customer) -> ResultMap in value.resultMap }, "customerUserErrors": customerUserErrors.map { (value: CustomerUserError) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The created customer object.
      public var customer: Customer? {
        get {
          return (resultMap["customer"] as? ResultMap).flatMap { Customer(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "customer")
        }
      }

      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] {
        get {
          return (resultMap["customerUserErrors"] as! [ResultMap]).map { (value: ResultMap) -> CustomerUserError in CustomerUserError(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: CustomerUserError) -> ResultMap in value.resultMap }, forKey: "customerUserErrors")
        }
      }

      public struct Customer: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Customer"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("phone", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, displayName: String, email: String? = nil, phone: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Customer", "id": id, "displayName": displayName, "email": email, "phone": phone])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A unique ID for the customer.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The customer’s name, email or phone number.
        public var displayName: String {
          get {
            return resultMap["displayName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "displayName")
          }
        }

        /// The customer’s email address.
        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        /// The customer’s phone number.
        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }
      }

      public struct CustomerUserError: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CustomerUserError"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .scalar(CustomerErrorCode.self)),
            GraphQLField("field", type: .list(.nonNull(.scalar(String.self)))),
            GraphQLField("message", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: CustomerErrorCode? = nil, field: [String]? = nil, message: String) {
          self.init(unsafeResultMap: ["__typename": "CustomerUserError", "code": code, "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The error code.
        public var code: CustomerErrorCode? {
          get {
            return resultMap["code"] as? CustomerErrorCode
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        /// The path to the input field that caused the error.
        public var field: [String]? {
          get {
            return resultMap["field"] as? [String]
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class CustomerAccessTokenCreateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation customerAccessTokenCreate($input: CustomerAccessTokenCreateInput!) {
      customerAccessTokenCreate(input: $input) {
        __typename
        customerAccessToken {
          __typename
          accessToken
        }
        customerUserErrors {
          __typename
          message
        }
      }
    }
    """

  public let operationName: String = "customerAccessTokenCreate"

  public var input: CustomerAccessTokenCreateInput

  public init(input: CustomerAccessTokenCreateInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("customerAccessTokenCreate", arguments: ["input": GraphQLVariable("input")], type: .object(CustomerAccessTokenCreate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(customerAccessTokenCreate: CustomerAccessTokenCreate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "customerAccessTokenCreate": customerAccessTokenCreate.flatMap { (value: CustomerAccessTokenCreate) -> ResultMap in value.resultMap }])
    }

    /// Creates a customer access token.
    /// The customer access token is required to modify the customer object in any way.
    public var customerAccessTokenCreate: CustomerAccessTokenCreate? {
      get {
        return (resultMap["customerAccessTokenCreate"] as? ResultMap).flatMap { CustomerAccessTokenCreate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "customerAccessTokenCreate")
      }
    }

    public struct CustomerAccessTokenCreate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CustomerAccessTokenCreatePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("customerAccessToken", type: .object(CustomerAccessToken.selections)),
          GraphQLField("customerUserErrors", type: .nonNull(.list(.nonNull(.object(CustomerUserError.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(customerAccessToken: CustomerAccessToken? = nil, customerUserErrors: [CustomerUserError]) {
        self.init(unsafeResultMap: ["__typename": "CustomerAccessTokenCreatePayload", "customerAccessToken": customerAccessToken.flatMap { (value: CustomerAccessToken) -> ResultMap in value.resultMap }, "customerUserErrors": customerUserErrors.map { (value: CustomerUserError) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The newly created customer access token object.
      public var customerAccessToken: CustomerAccessToken? {
        get {
          return (resultMap["customerAccessToken"] as? ResultMap).flatMap { CustomerAccessToken(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "customerAccessToken")
        }
      }

      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] {
        get {
          return (resultMap["customerUserErrors"] as! [ResultMap]).map { (value: ResultMap) -> CustomerUserError in CustomerUserError(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: CustomerUserError) -> ResultMap in value.resultMap }, forKey: "customerUserErrors")
        }
      }

      public struct CustomerAccessToken: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CustomerAccessToken"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(accessToken: String) {
          self.init(unsafeResultMap: ["__typename": "CustomerAccessToken", "accessToken": accessToken])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The customer’s access token.
        public var accessToken: String {
          get {
            return resultMap["accessToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "accessToken")
          }
        }
      }

      public struct CustomerUserError: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CustomerUserError"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("message", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(message: String) {
          self.init(unsafeResultMap: ["__typename": "CustomerUserError", "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The error message.
        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}
