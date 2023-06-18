//
//  NetworkManagerTest.swift
//  EasyBuy
//
//  Created by mo_fathy on 17/06/2023.
//

import XCTest
@testable import EasyBuy

final class NetworkManagerTest: XCTestCase {

    func testDataDecodingForAllProducts () {
        // Given: An API request to fetch all products
        let expectation = expectation(description: "Waiting for the API")
        
        NetworkManager.shared?.queryGraphQLRequest(query: GetAllProductsQuery(first: 100,imageFirst: 5, variantsFirst: 5), responseModel: DataClassProdcuts.self) { result in
            // When: The response is received
            
            // Then: The result should not be nil
            XCTAssertNotNil(result)
            expectation.fulfill()
            
        }
        
        self.waitForExpectations(timeout: 5)
    }
    
    func testProductsCount () {
        // Given: An API request to fetch all products
        let expectation = expectation(description: "Waiting for the API")

        NetworkManager.shared?.queryGraphQLRequest(query: GetAllProductsQuery(first: 11,imageFirst: 5, variantsFirst: 5), responseModel: DataClassProdcuts.self) { result in
            // When: The response is received
            switch result {
            case .success(let data):
                if let productEdges = data.products?.nodes?.count {
                    XCTAssertGreaterThan(productEdges, 10)
                    expectation.fulfill()
                }
            case .failure(_):
                XCTFail("Error fetching products")
                expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: 5)
    }
//
    func testDataDecodingForAllCollections () {
        // Given: An API request to fetch all collections
        let expectation = expectation(description: "Waiting for the API")

        NetworkManager.shared?.queryGraphQLRequest(query: CollectionsQuery(first: 100), responseModel: Res_Collection.self) { result in
            // When: The response is received

            // Then: The result should not be nil
            XCTAssertNotNil(result)
            expectation.fulfill()

        }

        self.waitForExpectations(timeout: 5)
    }

    func testCollectionsCountIsSix () {
        // Given: An API request to fetch all collections
        let expectation = expectation(description: "Waiting for the API")

        NetworkManager.shared?.queryGraphQLRequest(query: CollectionsQuery(first: 100), responseModel: Res_Collection.self)  { result in
            // When: The response is received
            switch result {
            case .success(let data):
                if let collectionEdges = data.collections {
                    let collections = collectionEdges.nodes?.count
                    // Then: The number of collections should be greater than 10
                    XCTAssertGreaterThan(collections!, 10)
                    expectation.fulfill()
                }
            case .failure(_):
                XCTFail("Error fetching collections")
                expectation.fulfill()
            }
        }

        self.waitForExpectations(timeout: 5)
    }

}
