import Foundation

class FAQViewModel: ObservableObject {
    @Published var faqItems: [FAQItem] = [
        FAQItem(question: "How can I create an account?", answer: "To create an account, tap on the 'Sign Up' button on the home screen and follow the prompts to enter your details and set a password."),
        FAQItem(question: "How do I search for products?", answer: "You can search for products by typing keywords in the search bar at the top of the screen. The app will display relevant results as you type."),
        FAQItem(question: "Can I save items to a wishlist?", answer: "Yes, you can save items to a wishlist by tapping the heart icon on the product details screen. You can access your wishlist from the 'My Account' section."),
        FAQItem(question: "What payment methods are accepted?", answer: "We accept major credit and debit cards, as well as digital payment methods such as Apple Pay and Google Pay."),
        FAQItem(question: "How can I track my order?", answer: "Once your order is confirmed, you will receive a tracking number via email. You can enter this tracking number in the 'Track Order' section of the app to check the status of your delivery."),
        FAQItem(question: "Is there a return policy?", answer: "Yes, we have a 30-day return policy. If you're not satisfied with your purchase, you can initiate a return request from the 'My Orders' section. Please review our return policy for more details.")
    ]
}
