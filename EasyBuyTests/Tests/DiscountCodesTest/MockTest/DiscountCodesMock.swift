//
//  DiscountCodesMock.swift
//  EasyBuyTests
//
//  Created by moamen ali gomaa on 18/06/2023.
//


import XCTest
@testable import EasyBuy

final class DiscountCodesMockTest: XCTestCase {

    func testDecodeDiscountCodesData() {
        // Given: A request to fetch all DiscountCodes
        MockNetworkManager.shared.queryAllDiscountCodes { result in
            XCTAssertNotNil(result)
        }
    }
    func testDecodeDiscountCodesCountIsFour() {
        // Given: A request to fetch all DiscountCodes
      
        MockNetworkManager.shared.queryAllDiscountCodes { result in
            switch result {
            case .success(let root):
                if let codeDiscounts = root.data?.codeDiscountNodes {
                    let codes = codeDiscounts.nodes                   // Then: The number of codes should be 4
                    XCTAssertEqual(codes?.count, 4)
                } else {
                    XCTFail("Error: codes not found in response")
                }
            case .failure(_):
                XCTFail("Error fetching codes")
            }
        }
    }
       
}

