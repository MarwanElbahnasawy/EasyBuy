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

// MARK: - CustomerAddress
struct CustomerAddress: Codable {
    var address1, address2, city, country: String?
    var id, phone, zip: String?
}
