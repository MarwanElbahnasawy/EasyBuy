import Foundation

// MARK: - CustomerDetailsResponse
struct CustomerDetailsResponse: Codable {
    let data: CustomerDetailsData?
}

// MARK: - DataClass
struct CustomerDetailsData: Codable {
    let customerDetails: CustomerDetails?
}

// MARK: - Customer
struct CustomerDetails: Codable {
    let displayName, email: String?
}
