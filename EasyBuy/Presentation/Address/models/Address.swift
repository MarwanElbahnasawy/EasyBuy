//
//  Address.swift
//  EasyBuy
//
//  Created by mo_fathy on 15/06/2023.
//

import Foundation
// MARK: - DataClass
struct ResAddress: Codable {
    var customerAddressCreate: CustomerAddressCreate?
}

// MARK: - CustomerAddressCreate
struct CustomerAddressCreate: Codable {
    var customerAddress: CustomerAddress?
}

// MARK: - DataClass
struct DataClassAddress: Codable {
    var customer: CustomAddress?
}

// MARK: - Customer
struct CustomAddress: Codable {
    var addresses: Addresses?
}

// MARK: - Addresses
struct Addresses: Codable {
    var nodes: [CustomerAddress]?
}

// MARK: - CustomerAddress
struct CustomerAddress: Codable {
    var address1, address2, city, country: String?
    var id, phone, zip: String?
}

// MARK: - DataClass
struct DataClassDeletedCustomer: Codable {
    var customerAddressDelete: CustomerAddressDelete?
}

// MARK: - CustomerAddressDelete
struct CustomerAddressDelete: Codable {
    var deletedCustomerAddressId: String?
}
