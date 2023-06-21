//
//  EasyBuyTests.swift
//  EasyBuyTests
//
//  Created by Marwan Elbahnasawy on 31/05/2023.
//

import XCTest
@testable import EasyBuy

final class EasyBuyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGetTagsExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let products = [Product]()
        let tags = getTags(products: products)
        XCTAssertEqual(tags.count, 3)
    }
    
    func testGetType() throws {
        let products = [Product(productType: "men"), Product(productType: "women"), Product(productType: "kid"), Product(productType: "men")]
        let types = getType(products: products)
        XCTAssertEqual(types.count, 3)
    }
    func testConvertDateToString() throws {
        let date = Date()
        let dateString = convertDateToString(date: date)
        XCTAssertNotNil(dateString)
    }
    
    func testFormatPrice10() {
        let price = "10.0"
        let expectedPrice = "10.00 USD"
        XCTAssertEqual(formatPrice(price: price), expectedPrice)
    }
    
    func testFormatPrice() throws {
        UserDefaults.standard.numCurrency = 1.0
        UserDefaults.standard.currency = "USD"
        let formattedPrice = formatPrice(price: "100")
        XCTAssertEqual(formattedPrice, "100.00 USD")
    }
    
    
}
