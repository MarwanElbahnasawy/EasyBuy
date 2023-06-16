import SwiftUI

struct ClientReviewListView: View {
    @ObservedObject var viewModel = ClientReviewViewModel()
    
    var body: some View {
        ScrollView {
            Text("Review Clients")
                .font(.headline)
            
            LazyVStack(spacing: 16) {
                ForEach(viewModel.displayedReviews) { review in
                    ClientReviewCell(
                        imageName: review.imageName,
                        name: review.name,
                        review: review.review,
                        stars: review.stars
                    )
                }
                
                if viewModel.displayedReviews.count < viewModel.reviews.count {
                    Button(action: {
                        viewModel.showAllReviews()
                    }) {
                        Text("See More")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
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
