import SwiftUI

struct FAQItemView: View {
    var item: FAQItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.question)
                .font(.headline)
                .bold()
            
            Text(item.answer)
                .font(.body)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

struct FAQItemView_Previews: PreviewProvider {
    static var previews: some View {
        FAQItemView(item: FAQItem(question: "Question", answer: "Answer"))
    }
}
