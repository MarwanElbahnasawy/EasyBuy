import XCTest
@testable import EasyBuy

class RegestrationViewModelTests: XCTestCase {
    
    var vm: RegestrationViewModel!
    
    override func setUp() {
        vm = RegestrationViewModel()
    }
    
    func testCreateCustomer_ShouldCreateCustomer_WhenRequestSucceeds() {
        // Given
        let customerInfo = CustomerCreateInput(
            firstName: "Ahmad",
            lastName: "Hemeda",
            email: "ahmadhemeda@gmail.com",
            phone: "+201088180334",
            password: "Ahm123"
        )
        let expectation = XCTestExpectation(description: "Complete GraphQL request")
        
        // When
        vm.createCustomer(newCustomerInput: customerInfo) { result in
            // Then
            switch result {
            case .success():
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "Timeout")
        }
    }
    
    func testCreateCustomer_ShouldFailToCreateCustomer_WhenRequestFails() {
        // Given
        let invalidCustomerInfo = CustomerCreateInput(email: "", password: "")
        let expectation = XCTestExpectation(description: "Complete GraphQL request")
        
        // When
        vm.createCustomer(newCustomerInput: invalidCustomerInfo ) { result in
            // Then
            switch result {
            case .success():
                XCTFail("Should be failure")
            case .failure(let error):
                XCTAssertNotNil(error, "Expected error with invalid input")
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "Timeout")
        }
    }
    
    func testIsFormValid_ShouldReturnTrue_WhenFormIsValid() {
        // Given
        vm.email = "hemeda17@email.com"
        vm.firstName = "Ahmad"
        vm.lastName = "Hemeda"
        vm.password = "Ahm123"
        vm.confirmPassword = "Ahm123"
        vm.phoneNumber = "+201099180334"
        
        // When
        let isFormValid = vm.isFormValid
        
        // Then
        XCTAssertTrue(isFormValid)
    }
    
    func testIsFormValid_ShouldReturnFalse_WhenEmailIsInvalid() {
        // Given
        vm.email = "invalid"
        vm.firstName = "Ahmad"
        vm.lastName = "Hemeda"
        vm.password = "Ahm123"
        vm.confirmPassword = "Ahm123"
        vm.phoneNumber = "+201099180334"
        
        // When
        let isFormValid = vm.isFormValid
        
        // Then
        XCTAssertFalse(isFormValid)
    }
    
    func testIsFormValid_ShouldReturnFalse_WhenFirstNameIsTooLong() {
        // Given
        vm.firstName = "AhmadHemedaAhmadHemeda"
        
        // When
        let isFormValid = vm.isFormValid
        
        // Then
        XCTAssertFalse(isFormValid)
    }
    
    func testIsFormValid_ShouldReturnFalse_WhenFirstNameIsTooShort() {
        // Given
        vm.firstName = "Ahm"
        
        // When
        let isFormValid = vm.isFormValid
        
        // Then
        XCTAssertFalse(isFormValid)
    }
    
    func testIsFormValid_ShouldReturnFalse_WhenFirstNameHasMixedCase() {
        // Given
        vm.firstName = "AhmaD"
        
        // When
        let isFormValid = vm.isFormValid
        
        // Then
        XCTAssertFalse(isFormValid)
    }
    
    func testIsFormValid_ShouldReturnFalse_WhenPasswordIsNonNumeric() {
        // Given
        vm.password = "abcdefgh"
        
        // When
        let isFormValid = vm.isFormValid
        
        // Then
        XCTAssertFalse(isFormValid)
    }
    
    func testIsFormValid_ShouldReturnFalse_WhenPasswordsDoNotMatch() {
        // Given
        vm.password = "Abcd1234"
        vm.confirmPassword = "Abcd1235"
            
        // When
        let isFormValid = vm.isFormValid
        
        // Then
        XCTAssertFalse(isFormValid)
    }
}
