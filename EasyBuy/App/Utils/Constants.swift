//
//  Constants.swift
//  EasyBuy
//
//  Created by Marwan Elbahnasawy on 31/05/2023.
//

import Foundation
import SwiftUI

enum NetworkConstants{
    static let baseUrl = "https://mad-ism-43.myshopify.com/api/2023-04/graphql.json"
    static let baseUrlAdmin = "https://mad-ism-43.myshopify.com/admin/api/2023-04/graphql.json"
    static let keyStoreFrontAccessToken = "X-Shopify-Storefront-Access-Token"
    static let keyAccessToken = "X-Shopify-Access-Token"
    static let valueStoreFrontAccessToken = "bcb67a8264943faf95b4440915051dbe"
    static let valueAccessToken = "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"
    static let keyContentType = "Content-Type"
    static let valueContentType = "application/json"
    static let CustomerDiscountCodes = "CustomerDiscountCodes"
}


struct Constants {
    
    
    
    struct AppColor {
        static let primaryBlack = Color.init("1F1F1F")
        static let secondaryBlack = Color.init("464B5F")
        static let primaryRed = Color.init("CB2D3E")
        static let secondaryRed = Color.init("EF473A")
    
    }
    
    struct AppFont {
        static let extraBoldFont = "OpenSans-ExtraBold"
        static let boldFont = "OpenSans-Bold"
        static let semiBoldFont = "OpenSans-SemiBold"
        static let regularFont = "OpenSans-Regular"
        static let lightFont = "OpenSans-Light"
    }
}

// COLOR

let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

// LAYOUT

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
var lineLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
}


func getTags(products: [Product])->[String]{
    var tags :[String] = ["men", "women", "kid"]
    products.forEach { Product in
        Product.tags?.forEach { Substring in
           tags.append(String(Substring))
        }
    }
    let set = Set(tags)
    tags = Array(set)
   return tags
}

func getType(products: [Product])->[String]{
    var tags :[String] = []
    products.forEach { Product in
        if let product_type = Product.productType{
            tags.append(product_type )
        }
    }
    let set = Set(tags)
    tags = Array(set)
   return tags
}

func convertDateToString(date :Date)->String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    let dateString = dateFormatter.string(from: date)
    return dateString
}
func mapLineItemsToDratOrderLineItems(lineItems: [LinesItemNode]?) -> [DraftOrderLineItemInput]{
  
    var draftOrderLineItemInputs: [DraftOrderLineItemInput] = []
    for item in lineItems ?? []{
        let draftLineItem = DraftOrderLineItemInput(quantity: 1,variantId: item.variant?.id)
        draftOrderLineItemInputs.append(draftLineItem)
    }
    return draftOrderLineItemInputs
}
