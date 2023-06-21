import Foundation

class FAQViewModel: ObservableObject {
    @Published var faqItems: [FAQItem] = [
        FAQItem(question: "How do I search for products?", answer: "You can search for products by typing keywords in the search bar at the top of the screen. The app will display relevant results as you type."),
        FAQItem(question: "Can I save items to a wishlist?", answer: "Yes, you can save items to a wishlist by tapping the heart icon on the product details screen. You can access your wishlist from the 'Wishlist' section."),
        FAQItem(question: "What payment methods are accepted?", answer: "We offer the convenience of Cash on Delivery (COD) for offline payments, as well as the seamless digital payment option through Apple Pay."),
        FAQItem(question: "How can I track my order?", answer: "Once your order is confirmed, you will receive a tracking number via email. You can enter this tracking number in the 'Track Order' section of the app to check the status of your delivery."),
        FAQItem(question: "Is there a return policy?", answer: "Yes, we have a 30-day return policy. If you're not satisfied with your purchase, you can initiate a return request from the 'My Orders' section. Please review our return policy for more details."),
        FAQItem(question: "Can I cancel my order?", answer: "Yes, you can cancel your order before it has been shipped. Please visit the 'My Orders' section to check the status of your order and initiate the cancellation process."),
        FAQItem(question: "How long does shipping take?", answer: "Shipping times may vary depending on your location and the availability of the product. Typically, orders are delivered within 3-5 business days. You can track the progress of your shipment using the provided tracking number."),
        FAQItem(question: "What if I receive a defective or damaged product?", answer: "If you receive a defective or damaged product, please contact our customer support within 48 hours of delivery. We will assist you in resolving the issue and arranging for a replacement or refund."),
        FAQItem(question: "Is my personal information secure?", answer: "Yes, we take the security and privacy of your personal information seriously. We implement industry-standard security measures to protect your data and ensure a safe shopping experience.")
    ]
}
