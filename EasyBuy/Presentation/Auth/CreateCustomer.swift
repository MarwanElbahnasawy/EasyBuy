import Foundation

// MARK: - CustomerCreateInput
struct CreateCustomer: Codable {
    let email, firstName, lastName, password: String?
    let phone: String?
}
