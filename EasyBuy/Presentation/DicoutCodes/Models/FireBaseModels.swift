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
}
extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
