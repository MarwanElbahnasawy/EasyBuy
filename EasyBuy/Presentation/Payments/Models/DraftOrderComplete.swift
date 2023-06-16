//
//  DraftOrderComplete.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 16/06/2023.
//

import Foundation

// MARK: - DataClass
struct DraftOrderCompleteDataClass: Codable {
    let draftOrderComplete: DraftOrderComplete?
}

// MARK: - DraftOrderComplete
struct DraftOrderCompleteRoot: Codable {
    let draftOrder: DraftOrderComplete?
}

// MARK: - DraftOrder
struct DraftOrderComplete: Codable {
    let id: String?
    let order: Order?
}

// MARK: - Order
struct OrderCompleteID: Codable {
    let id: String?
}
