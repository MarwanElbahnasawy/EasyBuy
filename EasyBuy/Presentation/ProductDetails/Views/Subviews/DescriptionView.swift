import SwiftUI

struct DescriptionView: View {
    let product: DataClass?
    
    init(for product: DataClass?) {
        self.product = product
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            ProductTitleView(title: product?.product?.title ?? "", productType: product?.product?.productType ?? "")
            
            RatingView(rating: 3.2)
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text(product?.product?.description ?? "")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            SizesView(sizes: product?.product?.options?.first(where: { $0.name == "Size" })?.values)
        }
        .padding()
        .padding(.top)
        .background(Color.gray)
        .cornerRadius(30, corners: [.topLeft, .topRight])
    }
}

