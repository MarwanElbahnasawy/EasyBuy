import SwiftUI

struct ClientReviewCell: View {
    let imageName: String
    let name: String
    let review: String
    let stars: Int
    
    var body: some View {
        HStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 80, height: 80)
                .shadow(radius: 4)
            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .font(.system(size: 15, weight: .bold))
                    Spacer()
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= stars ? "star.fill" : "star")
                            .foregroundColor(Color.yellow)
                            .font(.system(size: 12))
                    }
                }
                .padding(.vertical, 8)
                Text(review)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .lineLimit(nil)
            }
            .padding(.leading, 10)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

struct ClientReviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ClientReviewCell(imageName: "client1", name: "John Doe", review: "I love this product! It's exactly what I was looking for and has made my life so much easier. ", stars: 4)
    }
}
