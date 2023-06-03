//
//  Products.swift
//  EasyBuy
//
//  Created by mo_fathy on 01/06/2023.
//

import Foundation

// MARK: - ResProducts

struct ResProducts: Codable{
    var products: [Product]
}

// MARK: - Product

struct Product: Codable, Identifiable{
    var id: Int?
    var title, body_html, vendor, product_type: String?
    var handle: String?
    var published_scope, tags, admin_graphql_api_id: String?
    var variants: [Variant]?
    var options: [Option]?
    var images: [productImage]?
    var image: productImage?
}

// MARK: - Image

struct productImage: Codable , Identifiable{
    var id, product_id, position: Int?
    var width, height: Int?
    var src: String?
    var variant_ids: [Int]?
    var admin_graphql_api_id: String?
}

// MARK: - Option

//struct Option: Codable , Identifiable{
//    var id, product_id: Int?
//    var name: String?
//    var position: Int?
//    var values: [String]?
//}

// MARK: - Variant

struct Variant: Codable , Identifiable{
    var id, product_id: Int?
    var title, price, sku: String?
    var position: Int?
    var inventory_policy: String?
    var fulfillment_service, inventory_management, option1: String?
    var taxable: Bool?
    var barcode: String?
    var grams: Int?
    var image_id: Int?
    var weight: Double?
    var weight_unit: String?
    var inventory_item_id, inventory_quantity, old_inventory_quantity: Int?
    var presentment_prices: [PresentmentPrice]?
    var requires_shipping: Bool?
    var admin_graphql_api_id: String?
}

// MARK: - PresentmentPrice

struct PresentmentPrice: Codable {
    var price: Price?
    var compare_at_price: String?
}

// MARK: - Price

//struct Price : Codable {
//    var price : String?
//    var amount, currency_code: String?
//}



