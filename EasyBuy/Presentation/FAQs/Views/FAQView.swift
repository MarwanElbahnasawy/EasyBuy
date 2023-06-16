import SwiftUI

struct FAQView: View {
    @ObservedObject var viewModel = FAQViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Frequently Asked Questions")
                    .font(.title)
                    .bold()
                
                ForEach(viewModel.faqItems, id: \.question) { item in
                    FAQItemView(item: item)
                }
            }
            .padding()
        }
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
