//
//  FavoriteProducts.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 07/06/2023.
//

import SwiftUI

struct FavoriteProduct {
    let imageUrl: URL?
    let title: String
    let type: String
    let price: String
}

struct FavoriteProductsListView: View {
    @State private var searchText = ""

    let favoriteProducts: [FavoriteProduct] = [
        FavoriteProduct(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product 1", type: "Type 1", price: "$22.00"),
        FavoriteProduct(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product 2", type: "Type 2", price: "$33.00"),
        FavoriteProduct(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product 3", type: "Type 3", price: "$44.00"),
        FavoriteProduct(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product 4", type: "Type 4", price: "$55.00"),
        FavoriteProduct(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product 5", type: "Type 5", price: "$66.00"),
        FavoriteProduct(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product 6", type: "Type 6", price: "$77.00"),
        FavoriteProduct(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product 7", type: "Type 7", price: "$88.00"),
        FavoriteProduct(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product 8", type: "Type 8", price: "$99.00"),
        FavoriteProduct(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product 9", type: "Type 9", price: "$110.00"),
        FavoriteProduct(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product 10", type: "Type 10", price: "$121.00")
    ]
    
    var filteredProducts: [FavoriteProduct] {
        if searchText.isEmpty {
            return favoriteProducts
        } else {
            return favoriteProducts.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding()
            
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(filteredProducts, id: \.title) { favoriteProduct in
                        FavoriteAndCartCell(
                            imageUrl: favoriteProduct.imageUrl,
                            title: favoriteProduct.title,
                            type: favoriteProduct.type,
                            price: favoriteProduct.price
                        )
                    }
                }
                .padding()
            }
        }
    }
}

struct FavoriteProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteProductsListView()
    }
}
