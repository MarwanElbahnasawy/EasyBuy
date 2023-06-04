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
            ScrollView  {
                if let productImage = viewModel.product?.product?.featuredImage {
                    KFImage(URL(string: productImage.url ?? ""))
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                }
                
                DescriptionView(for: viewModel.product)
                
                VStack {
                    HStack {
                        VStack {
                            Text("Total price")
                            Text("$\(viewModel.product?.product?.variants?.edges?.first?.node?.price?.amount ?? "")")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Add to Cart action
                        }) {
                            Text("Add to Cart")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .padding()
                                .padding(.horizontal, 8)
                                .background(Color.black)
                                .cornerRadius(10.0)
                        }
                        
                    }
                    .padding()
                    .padding(.horizontal)
                    .cornerRadius(60.0, corners: .topLeft)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .edgesIgnoringSafeArea(.bottom)
                }
                
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
        .onAppear(perform: {
            viewModel.productId = productId
            viewModel.fetchProductDetails()
        })
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(viewModel: ProductViewModel(productId: nil), productId: "gid://shopify/Product/8311139762483")
    }
}

struct DescriptionView: View {
    let product: DataClass?
    
    init(for product: DataClass?) {
        self.product = product
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                VStack {
                    Text(product?.product?.title ?? "")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(product?.product?.productType ?? "")
                }
                
                Spacer()
                
                Button(action: {
                    // Heart button action
                }) {
                    Image(systemName: "heart")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }
            }
            
            HStack (spacing: 4) {
//                ForEach(0 ..< 5) { item in
//                    Image("star")
//                }
                
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "minus")
                        .padding(.all, 8)
                    
                }
                .frame(width: 30, height: 30)
                .overlay(RoundedCorner(radius: 50).stroke())
                .foregroundColor(.black)
                
                Text("1")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                
                Button(action: {}) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(.all, 8)
                        .background(Color.black)
                        .clipShape(Circle())
                }
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text(product?.product?.description ?? "")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            Text("Sizes")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            // TODO: Display all sizes
            if let sizeOptions = product?.product?.options?.first(where: { $0.name == "Size" })?.values {
                HStack {
                    ForEach(sizeOptions, id: \.self) { sizeOption in
                        Text(sizeOption)
                            .foregroundColor(.black)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color.gray)
        .cornerRadius(30, corners: [.topLeft, .topRight])
    }
}


struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.white)
                .padding(.all, 12)
                .background(Color.black)
                .cornerRadius(8.0)
        }
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
