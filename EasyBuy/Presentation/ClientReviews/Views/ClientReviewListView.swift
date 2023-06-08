import SwiftUI

struct ClientReviewListView: View {
    @ObservedObject var viewModel = ClientReviewViewModel()
    
    var body: some View {
        ScrollView {
            Text("Review Clients")
                .font(.headline)
            
            LazyVStack(spacing: 16) {
                ForEach(viewModel.reviews) { review in
                    ClientReviewCell(
                        imageName: review.imageName,
                        name: review.name,
                        review: review.review,
                        stars: review.stars
                    )
                }
            }
            .padding()
        }
    }
}

struct ClientReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        ClientReviewListView()
    }
}
