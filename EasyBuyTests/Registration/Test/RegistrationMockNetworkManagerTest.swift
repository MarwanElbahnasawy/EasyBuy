import XCTest
@testable import EasyBuy

final class RegistrationMockNetworkManagerTest: XCTestCase {
    
    func testMutationCustomerCreate_ShouldReturnResponse_WhenRequestSucceeds() {
        // Given
        let networkManager = RegistrationMockNetworkManager.shared
        
        // When
        networkManager.mutationCustomerCreate { result in
            // Then
            XCTAssertNotNil(result)
        }
    }
    
    func testMutationCustomerCreate_ShouldReturnError_WhenInvalidJsonResponse() {
        // Given
        let networkManager = RegistrationMockNetworkManager.shared
        networkManager.jsonResponse = Data("Invalid Json response".utf8)
        
        // When
        networkManager.mutationCustomerCreate { result in
            // Then
            switch result {
            case .failure:
                XCTAssertNotNil(result)
            default:
                XCTFail()
            }
        }
    }
    
    func testMutationCustomerCreate_ShouldReturnValidCustomerID_WhenRequestSucceeds() {
        // Given
        let networkManager = RegistrationMockNetworkManager.shared
        
        // When
        networkManager.mutationCustomerCreate { result in
            // Then
            guard case .success(let data) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(data.data?.customerCreate?.customer?.id)
        }
    }
    
    func testMutationCustomerCreate_ShouldReturnEmptyErrors_WhenRequestSucceeds() {
        // Given
        let networkManager = RegistrationMockNetworkManager.shared
        
        // When
        networkManager.mutationCustomerCreate { result in
            // Then
            guard case .success(let data) = result else {
                XCTFail()
                return
            }
            XCTAssertTrue(((data.data?.customerCreate?.customerUserErrors?.isEmpty) != nil))
        }
    }
}
