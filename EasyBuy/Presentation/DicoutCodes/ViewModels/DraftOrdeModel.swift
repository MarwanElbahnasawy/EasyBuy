// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - DataClass
struct OrderDataClass: Codable {
    let draftOrderCreate: DraftOrderCreate?
}

// MARK: - DraftOrderCreate
struct DraftOrderCreate: Codable {
    let draftOrder: DraftOrder?
}

// MARK: - DraftOrder
struct DraftOrder: Codable {
    let id: String?
}
