//
//  Models.swift
//  EasyBuy
//
//  Created by Marwan Elbahnasawy on 01/06/2023.
//

import Foundation


// MARK: - Root
struct Root: Codable {
    let products: Products
}

// MARK: - Products
struct Products: Codable {
    let edges: [Edge]
}

// MARK: - Edge
struct Edge: Codable {
    let cursor: String
    let node: Node
}

// MARK: - Node
struct Node: Codable {
    let title: String
}
