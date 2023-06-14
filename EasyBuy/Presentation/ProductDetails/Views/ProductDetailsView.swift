import SwiftUI
import Apollo
import Kingfisher

struct ProductDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: ProductViewModel
    let productId: GraphQLID
    
    var body: some View {
        ZStack {
            Color.white
            ScrollView {
                ProductImagesView(images: viewModel.product?.product?.images?.edges?.map { $0.node! } ?? [])

                DescriptionView(for: viewModel.product, viewModel: viewModel)
                
                AddToCartView(price: viewModel.product?.product?.variants?.edges?.first?.node?.price?.amount) {
                    print("pressed")
                    viewModel.getDraftOrder()

                }.alert(isPresented: $viewModel.isExist) {
                    Alert(title: Text("Already added"),message: Text("This product already exist in your shopping cart"))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
        .onAppear(perform: {
            viewModel.productId = productId
            viewModel.fetchProductDetails()
        })
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(viewModel: ProductViewModel(productId: nil), productId: "gid://shopify/Product/8311139762483")
    }
}

