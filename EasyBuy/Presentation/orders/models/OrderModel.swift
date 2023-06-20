//
//  Order.swift
//  EasyBuy
//
//  Created by mo_fathy on 01/06/2023.
//

import Foundation

// MARK: - ResOrder
struct ResOrder: Codable {
    var orders: Orders?
}

// MARK: - Orders
struct Orders: Codable {
    var edges: [Edge]?
}

// MARK: - Edge
struct Edge: Codable {
    var node: Order?
}

struct Order: Codable, Identifiable {
    var name: String?
    var id: String?
    var buyerAcceptsMarketing: Bool?
    var currentTotalPrice: String?
    var createdAt: String?
    var totalPriceSet: TotalPriceSet?
    var number, orderNumber: Int?
    var token, totalDiscounts: String?
    var totalPrice: String?
    var billingAddress: Address?
 //   var fulfillments: [Fulfillment]?
    var displayFulfillmentStatus, displayFinancialStatus, returnStatus: String?
}

// MARK: - TotalPriceSet
struct TotalPriceSet: Codable {
    var presentmentMoney, shopMoney: Money?
}

// MARK: - Money
struct Money: Codable {
    var amount, currencyCode: String?
}

// MARK: - Address

struct Address: Codable {
    var address1: String?
       var lastName, city, country, zip: String?
       var phone, id: String?
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
