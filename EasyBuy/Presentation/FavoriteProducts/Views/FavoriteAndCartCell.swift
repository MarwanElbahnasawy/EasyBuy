import SwiftUI
import Kingfisher

struct FavoriteAndCartCell: View {
    @State var imageUrl: URL?
    @State var title: String?
    @State var type: String?
    @State var price: String?
    var onDelete: (() -> Void)?
    @State var quantity: Int = 1
    @State var availableQuantity = 10
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                KFImage(imageUrl)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                VStack(alignment: .leading) {
                    Text(title ?? "not available")
                        .font(.system(size: 12, weight: .bold)).lineLimit(0)
               
                        Text(type ?? "not available")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    Spacer()
                    Stepper(value: $quantity, in: 1...availableQuantity) {
                                   Text("Quantity : \(quantity)")
                               }
                    Text(price ?? "not available")
                        .font(.system(size: 16, weight: .bold))
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height/6)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
              
            )

            Button(action: {
                onDelete?()
            }) {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.black)
            }
            .padding(8)
        }
    }
}

struct FavoriteAndCartCell_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteAndCartCell(imageUrl: URL(string: "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"), title: "Product", type: "Type", price: "$22.00")
    }
}
