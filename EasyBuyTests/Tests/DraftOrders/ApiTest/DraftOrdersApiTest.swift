//
//  DraftOrdersApiTest.swift
//  EasyBuyTests
//
//  Created by moamen ali gomaa on 18/06/2023.
//


import XCTest
@testable import EasyBuy

final class DraftOrderApiTest: XCTestCase {

   
    func testDataDecodingForDradtOrder() {
        // Given: An API request to fetch draft order
        let expectation = expectation(description: "Waiting for the API")
        
        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query: DraftOrderQuery(id: "gid://shopify/DraftOrder/1120714129715"), responseModel: DraftOrderDataClass.self) { result in
            // When: The response is received
            
            // Then: The result should not be nil
            XCTAssertNotNil(result)
            expectation.fulfill()
            
        }
        
        self.waitForExpectations(timeout: 5)
    }
    func testDraftOrderID() {
        // Given: An API request to fetch all products
        let expectation = expectation(description: "Waiting for the API")

        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query: DraftOrderQuery(id: "gid://shopify/DraftOrder/1120714129715"), responseModel: DraftOrderDataClass.self) { result in
            // When: The response is received
            switch result {
            case .success(let data):
                if let draftOrder = data.draftOrderCreate?.draftOrder?.id {
                    XCTAssertEqual(draftOrder, "gid://shopify/DraftOrder/1120714129715")
                    expectation.fulfill()
                }
                expectation.fulfill()
            case .failure(_):
                XCTFail("Error fetching products")
                expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: 5)
    }
       
}

