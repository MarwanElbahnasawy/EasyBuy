//
//  CategoryViewModelTests.swift
//  EasyBuyTests
//
//  Created by mo_fathy on 22/06/2023.
//

import Foundation
import Apollo
import XCTest
@testable import EasyBuy

class CategoryViewModelTests: XCTestCase {
    
    var viewModel: CategoryViewModel!
    
    override func setUpWithError() throws {
        viewModel = CategoryViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchProducts() {
        let expectation = self.expectation(description: "Fetching category products")
        
        viewModel.fetchProducts()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.viewModel.items)
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertFalse(self.viewModel.iserror)
            XCTAssertFalse(self.viewModel.products.isEmpty)
            XCTAssertFalse(self.viewModel.tags.isEmpty)
            XCTAssertFalse(self.viewModel.arrFilter.isEmpty)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testFilterTag() {
        viewModel.items = [Product(id: "1", title: "Product 1", productType: "Type A", tags: ["Tag A", "Tag B"]), Product(id: "2", title: "Product 2", productType: "Type B", tags: ["Tag B", "Tag C"])]
        viewModel.filterBy = "All"
        viewModel.activeTag = "All"
        
        viewModel.filterTag()
        
        XCTAssertEqual(viewModel.products.count, 2)
        
        viewModel.activeTag = "Tag A"
        
        viewModel.filterTag()
        
        XCTAssertEqual(viewModel.products.count, 1)
        XCTAssertEqual(viewModel.products[0].id, "1")
        
        viewModel.filterBy = "Type B"
        
        viewModel.filterTag()
        
        XCTAssertEqual(viewModel.products.count, 0)
    }
    
}
