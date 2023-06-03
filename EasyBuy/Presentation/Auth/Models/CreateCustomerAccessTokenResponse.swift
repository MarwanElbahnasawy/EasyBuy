import Foundation

// MARK: - CreateCustomerAccessTokenResponse
struct CreateCustomerAccessTokenResponse: Codable {
    let data: CustomerAccessTokenCreateData?
}

// MARK: - DataClass
struct CustomerAccessTokenCreateData: Codable {
    let customerAccessTokenCreate: CustomerAccessTokenCreate?
}

// MARK: - CustomerAccessTokenCreate
struct CustomerAccessTokenCreate: Codable {
    let customerAccessToken: CustomerAccessToken?
    let customerAccessTokenError: [CustomerAccessTokenError]?
}

// MARK: - CustomerAccessToken
struct CustomerAccessToken: Codable {
    let accessToken: String?
    let expiresAt: Date?
}

// MARK: - CustomerUserError
struct CustomerAccessTokenError: Codable {
    let code: String?
    let field: String?
    let message: String?
}
