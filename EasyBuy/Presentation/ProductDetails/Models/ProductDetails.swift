import Foundation

// MARK: - Product
struct ProductDetails: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let product: ProductClass?
}

// MARK: - ProductClass
struct ProductClass: Codable {
    let id, title, description, productType: String?
    let vendor: String?
    let options: [Option]?
    let variants: Variants?
    let featuredImage: FeaturedImage?
    let images: Images?
}

// MARK: - FeaturedImage
struct FeaturedImage: Codable {
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
    let node: Nodes?
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

