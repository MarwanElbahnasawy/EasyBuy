// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct RootDraftOrder: Codable {
    let data: DraftOrderDataClass?
    let extensions: Extensions?
}
// MARK: - DataClass
struct DraftOrderDataClass: Codable {
    let draftOrderCreate: DraftOrderCreate?
}

// MARK: - DraftOrderCreate
struct DraftOrderCreate: Codable {
    let draftOrder: DraftOrder?
}

// MARK: - DraftOrder
struct DraftOrder: Codable {
    let id, name, email, subtotalPrice: String?
    let note2, totalPrice: String?
    let lineItems: LineItems?
}

// MARK: - LineItems
struct LineItems: Codable {
    let nodes: [LinesItemNode]?
}

// MARK: - Node
struct LinesItemNode: Codable,Identifiable {
    var id: String?
    let quantity: Int?
    let variant: Variant?
    let product: DrafrtOrderProduct?
}

// MARK: - Product
struct DrafrtOrderProduct: Codable {
    let id: String?
    let priceRangeV2: PriceRangeV2?
    let title, productType: String?
    let featuredImage: FeaturedImage?
}


// MARK: - PriceRangeV2
struct PriceRangeV2: Codable {
    let maxVariantPrice: MaxVariantPrice?
}

// MARK: - MaxVariantPrice
struct MaxVariantPrice: Codable {
    let amount, currencyCode: String?
}

// MARK: - Variant
struct Variant: Codable {
    let id, price: String?
    let availableForSale: Bool?
    let title: String?
}


// MARK: - DataClass
struct DeleteDraftOrderDataClass: Codable {
    let draftOrderDelete: DraftOrderDelete?
}

// MARK: - DraftOrderDelete
struct DraftOrderDelete: Codable {
    let deletedID: String?

    enum CodingKeys: String, CodingKey {
        case deletedID = "deletedId"
    }
}

// MARK: - DataClass
struct UpdateDraftOrderDataClass: Codable {
    let draftOrderUpdate: DraftOrderUpdate?
}

// MARK: - DraftOrderUpdate
struct DraftOrderUpdate: Codable {
    let draftOrder: DraftOrder?
}


