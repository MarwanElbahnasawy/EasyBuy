//
//  Model.swift
//  EasyBuy
//
//  Created by mo_fathy on 01/06/2023.
//

import Foundation

// MARK: - DataClass
struct SmartCollections: Codable {
    var collections: Collections?
}

// MARK: - Collections
struct Collections: Codable {
    var nodes: [Brand]?
}

// MARK: - Brand
struct Brand: Codable {
    var id: String?
    var image: Image_Brand?
    var handle, title: String?
}

// MARK: - Image
struct Image_Brand: Codable {
    var url: String?
}

 
