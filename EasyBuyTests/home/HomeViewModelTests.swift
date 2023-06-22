//
//  HomeViewModelTests.swift
//  EasyBuyTests
//
//  Created by mo_fathy on 22/06/2023.
//

import Foundation
import Apollo
import XCTest
@testable import EasyBuy

final class HomeViewModelTest: XCTestCase {
    
    var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchBrands() {
        let expectation = self.expectation(description: "Fetching brands")
        
        viewModel.fetchBrands()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.viewModel.brands)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testFetchProducts() {
        let expectation = self.expectation(description: "Fetching products")
        
        viewModel.fetchProducts()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.viewModel.items)
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertFalse(self.viewModel.iserror)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetCurrency() {
        let expectation = self.expectation(description: "Fetching currency")
        
        viewModel.getCurrency()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.viewModel.rates)
            XCTAssertNotNil(UserDefaults.standard.numCurrency)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
