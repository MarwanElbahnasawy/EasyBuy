import Foundation

class ClientReviewViewModel: ObservableObject {
    @Published var reviews: [ClientReview] = [
        ClientReview(imageName: "client1", name: "John Smith", review: "I love this product! It's exactly what I was looking for and has made my life so much easier.", stars: 5),
        ClientReview(imageName: "client2", name: "Jane Doe", review: "This product is okay. It gets the job done, but I wish it had more features.", stars: 3),
        ClientReview(imageName: "client3", name: "Bob Johnson", review: "I'm not impressed with this product. It doesn't work as well as advertised and I wouldn't recommend it to others.", stars: 2),
        ClientReview(imageName: "client4", name: "Alice Green", review: "This product exceeded my expectations! It's durable, easy to use, and has helped me save time and money.", stars: 5),
        ClientReview(imageName: "client5", name: "David Brown", review: "I'm satisfied with this product. It's not perfect, but it does what it's supposed to do and the price is reasonable.", stars: 4),
        ClientReview(imageName: "client6", name: "Emily Davis", review: "I'm disappointed with this product. It broke after just a few uses and the customer service was unhelpful.", stars: 1)
    ]
}
