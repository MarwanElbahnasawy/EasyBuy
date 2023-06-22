//
//  BrandViewModelTests.swift
//  EasyBuyTests
//
//  Created by mo_fathy on 22/06/2023.
//

import Foundation
import Apollo
import XCTest
@testable import EasyBuy

class BrandViewModelTests: XCTestCase {
    
    var viewModel: BrandViewModel!
    
    override func setUpWithError() throws {
        viewModel = BrandViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchBrand() {
        let expectation = self.expectation(description: "Fetching brand products")
        
        viewModel.id = "vans"
        viewModel.fetchBrand()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.viewModel.items)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
