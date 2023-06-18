import XCTest
@testable import EasyBuy

final class LoginMockNetworkManagerTest: XCTestCase {
    
    func testMutationCustomerAccessTokenCreate_ShouldReturnResponse_WhenRequestSucceeds() {
        // Given
        let networkManager = LoginMockNetworkManager.shared
        
        // When
        networkManager.mutationCustomerAccessTokenCreate { result in
            // Then
            XCTAssertNotNil(result)
        }
    }
    
    func testMutationCustomerAccessTokenCreate_ShouldReturnError_WhenInvalidJsonResponse() {
        // Given
        let networkManager = LoginMockNetworkManager.shared
        networkManager.jsonResponse = Data("Invalid Json response".utf8)
        
        // When
        networkManager.mutationCustomerAccessTokenCreate { result in
            // Then
            switch result {
            case .failure:
                XCTAssertNotNil(result)
            default:
                XCTFail()
            }
        }
    }
    
    func testMutationCustomerAccessTokenCreate_ShouldReturnValidAccessToken_WhenRequestSucceeds() {
        // Given
        let networkManager = LoginMockNetworkManager.shared
        
        // When
        networkManager.mutationCustomerAccessTokenCreate { result in
            // Then
            guard case .success(let data) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(data.data?.customerAccessTokenCreate?.customerAccessToken?.accessToken)
        }
    }
    
    func testMutationCustomerAccessTokenCreate_ShouldReturnEmptyErrors_WhenRequestSucceeds() {
        // Given
        let networkManager = LoginMockNetworkManager.shared
        
        // When
        networkManager.mutationCustomerAccessTokenCreate { result in
            // Then
            guard case .success(let data) = result else {
                XCTFail()
                return
            }
            XCTAssertTrue(((data.data?.customerAccessTokenCreate?.customerAccessTokenError?.isEmpty) != nil))
        }
    }
}
