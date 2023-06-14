import SwiftUI

struct RatingView: View {
    let rating: Double

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0 ..< 5) { index in
                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                    .foregroundColor(.black)
                    .overlay(
                        index < Int(rating) ? Image(systemName: "star")
                            .foregroundColor(.black)
                            .opacity(0.3)
                            .mask(Rectangle().frame(width: 10, height: 10).rotationEffect(.degrees(45)))
                            .overlay(Rectangle().frame(width: 1, height: 7).foregroundColor(.black).rotationEffect(.degrees(45)).offset(x: -4, y: -1.5))
                            .overlay(Rectangle().frame(width: 1, height: 7).foregroundColor(.black).rotationEffect(.degrees(45)).offset(x: 3, y: -7))
                            : nil
                    )
            }
            Text("(\(String(format: "%.1f", rating)))")
                .opacity(0.5)
                .padding(.leading, 8)
            Spacer()
            NavigationLink(destination: ClientReviewListView()) {
                Text("Reviews")
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
    }
}
