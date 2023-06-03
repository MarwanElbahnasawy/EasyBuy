import Foundation

// MARK: - CustomerCreateResponse
struct CreateCustomerResponse: Codable {
    let data: CustomerCreateData?
}

// MARK: - CustomerCreateData
struct CustomerCreateData: Codable {
    let customerCreate: CustomerCreate?
}

// MARK: - CustomerCreate
struct CustomerCreate: Codable {
    let customer: Customer?
    let customerUserErrors: [CustomerUserError]?
}

// MARK: - Customer
struct Customer: Codable {
    let id, displayName, email, phone: String?
}

// MARK: - CustomerUserError
struct CustomerUserError: Codable {
    let code: String?
    let field: [String]?
    let message: String?
}
