//
//  Order.swift
//  EasyBuy
//
//  Created by mo_fathy on 01/06/2023.
//

import Foundation

struct ResOrder: Codable {
    var orders: [Order]
}

struct Order: Codable {
    var id: Int?
    var buyerAcceptsMarketing: Bool?
    var currentTotalPrice: String?
    var createdAt: Date?
    var number, orderNumber: Int?
    var token, totalDiscounts: String?
    var totalPrice: String?
    var shippingAddress: Address?
    var fulfillments: [Fulfillment]?
}
// MARK: - Address

struct Address: Codable {
    var first_name: String?
    var address1, phone, city, zip: String?
    var province, country: String?
    var last_name: String?
    var address2: String?
    var latitude, longitude: Double?
    var name, country_code, province_code: String?
    var id, customer_id: Int?
    var country_name: String?
}


// MARK: - Fulfillment

struct Fulfillment: Codable {
    var id: Int?
    var location_id: Int?
    var name: String?
    var order_id: Int?
    var service: String?
    var status, tracking_company, tracking_number: String?
    var tracking_numbers: [String]?
    var tracking_url: String?
    var tracking_urls: [String]?
}
