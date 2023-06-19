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
            
            if viewModel.product == nil {
                ProgressView()
            } else {
                ScrollView {
                    ProductImagesView(images: viewModel.product?.product?.images?.edges?.map { $0.node! } ?? [])
                    
                    DescriptionView(
                        product: viewModel.product,
                        viewModel: viewModel,
                        isExist: $viewModel.isFavoriteExist
                    )
                    
                    AddToCartView(price: viewModel.price) {
                        print("pressed")
                        viewModel.getDraftOrder()
                    }.alert(isPresented: $viewModel.isExist) {
                        Alert(title: Text("Already added"), message: Text("This product already exists in your shopping cart"))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: { presentationMode.wrappedValue.dismiss() }))
        .onAppear(perform: {
            viewModel.productId = productId
            viewModel.fetchProductDetails()
          
//            viewModel.getFavoriteDraftOrder()
        })
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(viewModel: ProductViewModel(productId: nil), productId: "gid://shopify/Product/8311139762483")
    }
}
