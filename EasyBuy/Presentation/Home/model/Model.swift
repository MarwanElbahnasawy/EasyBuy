//
//  Model.swift
//  EasyBuy
//
//  Created by mo_fathy on 01/06/2023.
//

import Foundation

struct SmartCollections: Codable {
    var smart_collections : [Brand]
}

struct Brand: Codable {
    var title: String?
    var id: Int?
    var image : BrandImage?
}

struct BrandImage : Codable {
    var src : String?
}

 
