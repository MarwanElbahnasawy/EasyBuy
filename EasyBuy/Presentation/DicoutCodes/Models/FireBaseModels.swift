//
//  FireBaseModels.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 05/06/2023.
//

import Foundation

struct CustomerDiscountCodes: Codable{
    var id: String?
    var discountCodes: [String]?
    var usedDiscountCodes: [String]?
    var draftOrders: DraftOrders?
}
struct DraftOrders: Codable{
    var favoriteDraftorder: DraftOrderDataClass?
    var cartDraftOrder: DraftOrderDataClass?
}
extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
