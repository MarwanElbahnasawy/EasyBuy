import SwiftUI

struct ClientReviewListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.black)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: { presentationMode.wrappedValue.dismiss()}))
    }
}


struct ClientReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        ClientReviewListView()
    }
}
