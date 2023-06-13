import Foundation

// MARK: - Welcome
struct ProductsRoot: Codable {
    var data: DataClassProdcuts?
}

// MARK: - DataClass
struct DataClassProdcuts: Codable {
    var products: Products?
}

// MARK: - Products
struct Products: Codable {
    var nodes: [Product]?
}


struct ProductDetails: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let product: Product?
}

// MARK: - Product
struct Product: Codable ,Identifiable {
    var id, title, description, productType: String?
    var vendor: String?
    var tags: [String]?
    var options: [Option]?
    var variants: Variants?
    var featuredImage: FeaturedImage?
    var images: Images?
}

// MARK: - FeaturedImage
struct FeaturedImage: Codable,Identifiable {
    let id: String?
    let url: String?
}

// MARK: - Images
struct Images: Codable {
    let edges: [ImagesEdge]?
}

// MARK: - ImagesEdge
struct ImagesEdge: Codable {
    let node: FeaturedImage?
}

// MARK: - Option
struct Option: Codable {
    let name: String?
    let values: [String]?
}

// MARK: - Variants
struct Variants: Codable {
    let edges: [VariantsEdge]?
}

// MARK: - VariantsEdge
struct VariantsEdge: Codable {
    var node: Nodes?
}

// MARK: - Node
struct Nodes: Codable {
    let id, title: String?
    let price: Price?
    let availableForSale: Bool?
}

// MARK: - Price
struct Price: Codable {
    let amount, currencyCode: String?
}

