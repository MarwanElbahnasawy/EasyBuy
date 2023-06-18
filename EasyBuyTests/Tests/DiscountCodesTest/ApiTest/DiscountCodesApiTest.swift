//
//  DiscountCodesApiTest.swift
//  EasyBuyTests
//
//  Created by moamen ali gomaa on 18/06/2023.
//

import XCTest
@testable import EasyBuy

final class DiscountCodesApiTest: XCTestCase {

   
    func testDataDecodingForAllDiscountCodes() {
        // Given: An API request to fetch all discount codes
        let expectation = expectation(description: "Waiting for the API")
        
        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query: GetAllDiicountCodesQuery(first: 10), responseModel: DataDiscountCodes.self) { result in
            // When: The response is received
            
            // Then: The result should not be nil
            XCTAssertNotNil(result)
            expectation.fulfill()
            
        }
        
        self.waitForExpectations(timeout: 5)
    }
    func testDiscountCodesCount () {
        // Given: An API request to fetch all products
        let expectation = expectation(description: "Waiting for the API")

        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query: GetAllDiicountCodesQuery(first: 10), responseModel: DataDiscountCodes.self) { result in
            // When: The response is received
            switch result {
            case .success(let data):
                if let discounCodes = data.codeDiscountNodes?.nodes?.count {
                    XCTAssertLessThan(discounCodes, 10)
                    XCTAssertEqual(discounCodes, 4)
                    expectation.fulfill()
                }
            case .failure(_):
                XCTFail("Error fetching products")
                expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: 5)
    }
       
}

