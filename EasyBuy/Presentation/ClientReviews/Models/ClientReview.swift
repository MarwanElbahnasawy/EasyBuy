import Foundation

struct ClientReview: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let review: String
    let stars: Int
}
