import XCTest
@testable import EasyBuy

class ProductDetailsMockNetworkManagerTests: XCTestCase {
    
    let sut = ProductDetailsMockNetworkManager.shared
    
    func testQueryProductDetails_ShouldReturnProductDetails_WhenRequestSucceeds() {
        // Given
        let expectation = XCTestExpectation(description: "Product details request success")
        
        // When
        sut.queryProductDetails { result in
            switch result {
            case .success(let products):
                // Then
                XCTAssertNotNil(products.data?.product)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Query failed with error: \(error)")
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }

    func testQueryProductDetails_ShouldReturnProductDetailsWithCorrectID_WhenRequestSucceeds() {
        // Given
        let expectation = XCTestExpectation(description: "Product details request success")
        
        // When
        sut.queryProductDetails { result in
            switch result {
            case .success(let products):
                // Then
                XCTAssertEqual(products.data?.product?.id, "gid://shopify/Product/8311139107123")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Query failed with error: \(error)")
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }

    func testQueryProductDetails_ShouldReturnProductDetailsWithCorrectTitle_WhenRequestSucceeds() {
        // Given
        let expectation = XCTestExpectation(description: "Product details request success")
        
        // When
        sut.queryProductDetails { result in
            switch result {
            case .success(let products):
                // Then
                XCTAssertEqual(products.data?.product?.title, "VANS |AUTHENTIC | LO PRO | BURGANDY/WHITE")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Query failed with error: \(error)")
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
