import XCTest
@testable import EasyBuy

class LoginViewModelTests: XCTestCase {

    func testCreateAccessToken_ShouldCreateAccessToken_WhenRequestSucceeds() {
        // Given
        let viewModel = LoginViewModel()
        let input = CustomerAccessTokenCreateInput(
            email: "hemeda17@gmail.com",
            password: "Ahm123")
        
        let exp = expectation(description: "Complete GraphQL request")
        
        // When
        viewModel.createAccessToken(newAccessTokenInput: input) { result in
            switch result {
            case .success():
                // Then
                XCTAssertNotNil(viewModel.tokenString, "Access token should be created")
                exp.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "Timeout")
        }
    }

    func testCreateAccessToken_ShouldFailToCreateAccessToken_WhenRequestFails() {
        // Given
        let viewModel = LoginViewModel()
        let invalidInput = CustomerAccessTokenCreateInput(email: "", password: "")
        
        // When
        viewModel.createAccessToken(newAccessTokenInput: invalidInput) { result in
            switch result {
            case .success():
                XCTFail("Should be failure")
            case .failure:
                // When
                XCTAssertNotNil(result, "Expected error")
            }
        }
    }
}
