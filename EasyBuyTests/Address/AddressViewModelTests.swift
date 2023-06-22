//
//  AddressViewModelTests.swift
//  EasyBuyTests
//
//  Created by mo_fathy on 22/06/2023.
//

import Foundation
import Apollo
import XCTest
@testable import EasyBuy

class AddressViewModelTests: XCTestCase {
    
    var viewModel: AddressViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = AddressViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testAddLocation() {
        let initialCount = viewModel.locations.count
        viewModel.addLocation()
        XCTAssertEqual(viewModel.locations.count, initialCount + 1)
    }
    
    func testValidatePhoneNumber() {
        XCTAssertTrue(viewModel.validatePhoneNumber(value: "01123456788"))
        XCTAssertTrue(viewModel.validatePhoneNumber(value: "01123456789"))
        XCTAssertTrue(viewModel.validatePhoneNumber(value: "01567890123"))
        XCTAssertTrue(viewModel.validatePhoneNumber(value: "01000000000"))
        XCTAssertFalse(viewModel.validatePhoneNumber(value: "012345678"))
        XCTAssertFalse(viewModel.validatePhoneNumber(value: "1234567890"))
        XCTAssertFalse(viewModel.validatePhoneNumber(value: "0123456890"))
        XCTAssertFalse(viewModel.validatePhoneNumber(value: "0112345678"))
    }
    
    func testFeatchAddress() {
        let expect = expectation(description: "fetch address")
        viewModel.featchAddress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertTrue(self.viewModel.address.count > 0)
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertFalse(self.viewModel.iserror)
            expect.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
