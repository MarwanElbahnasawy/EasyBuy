//
//  DiscountCodesModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 03/06/2023.
//

import Foundation

// MARK: - DataClass
struct DataDiscountCodes: Codable{
    let codeDiscountNodes: CodeDiscountNodes?
}

// MARK: - CodeDiscountNodes
struct CodeDiscountNodes: Codable {
    let nodes: [CodeDiscountNodesNode]?
}

// MARK: - CodeDiscountNodesNode
struct CodeDiscountNodesNode: Codable,Identifiable {
    let id: String?
    let codeDiscount: CodeDiscount?
}

// MARK: - CodeDiscount
struct CodeDiscount: Codable {
    let title, summary: String?
    let codeCount: Int?
    let usageLimit: Int?
    let status: String?
    let customerGets: CustomerGets?
    let codes: Codes?
}

// MARK: - Codes
struct Codes: Codable {
    let nodes: [CodesNode]?
}

// MARK: - CodesNode
struct CodesNode: Codable {
    let code, id: String?
}

// MARK: - CustomerGets
struct CustomerGets: Codable {
    let items, value: Items?
}

// MARK: - Items
struct Items: Codable {
    let typename: String?

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
    }
}

// MARK: - Extensions
struct Extensions: Codable {
    let cost: Cost?
}

// MARK: - Cost
struct Cost: Codable {
    let requestedQueryCost, actualQueryCost: Int?
    let throttleStatus: ThrottleStatus?
}

// MARK: - ThrottleStatus
struct ThrottleStatus: Codable {
    let maximumAvailable, currentlyAvailable, restoreRate: Int?
}
