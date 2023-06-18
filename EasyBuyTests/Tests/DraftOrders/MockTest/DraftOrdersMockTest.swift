//
//  DraftOrdersMockTest.swift
//  EasyBuyTests
//
//  Created by moamen ali gomaa on 18/06/2023.
//


import XCTest
@testable import EasyBuy

final class DraftOrdeeMockTest: XCTestCase {
    var id: String?
    override func setUp() {
        id = "gid://shopify/DraftOrder/1120714129715"
    }
 
    func testDraftOrderData() {
        // Given: A request to fetch draft order by id
        MockNetworkManager.shared.queryDraftOrder(id: id ?? "", completion: { result in
            XCTAssertNotNil(result)
        })
    }
    func testDecodeDraftOrderID() {
        // Given: A request to fetch order by id
      
        MockNetworkManager.shared.queryDraftOrder(id: id ?? " ", completion: {[weak self] result in

                switch result {
                case .success(let root):
                    if let draftOrderID = root.draftOrder?.id {
                        // Then: the id should be equal
                        XCTAssertEqual(draftOrderID, self?.id)
                    } else {
                        XCTFail("Error: draft order not found in response")
                    }
                case .failure(let error):
                    print(error)
                    XCTFail("Error fetching codes")
                }
        })
    }
       
}

