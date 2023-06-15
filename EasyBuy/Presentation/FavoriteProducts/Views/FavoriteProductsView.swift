import SwiftUI

struct FavoriteProductsView: View {
    @ObservedObject var favoriteProductViewModel: FavoriteListViewModel
    @State private var showAlert = false
    @State private var indexSet: IndexSet?
    @State private var searchText = ""
    @State private var isSearching = false

    var body: some View {
        VStack {
            SearchBar(text: $searchText, isEditing: $isSearching)

            Text("Wishlist")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            ScrollView {
                LazyVStack {
                    ForEach(favoriteProductViewModel.products ?? [], id: \.variant?.id) { item in
                        FavoriteAndCartCell(
                            imageUrl: URL(string: item.product?.featuredImage?.url ?? "not available"),
                            title: item.product?.title,
                            type: item.product?.productType,
                            price: item.product?.priceRangeV2?.maxVariantPrice?.amount,
                            onDelete: {
                                showAlert = true
                                indexSet = favoriteProductViewModel.indexSet(for: item) ?? IndexSet()
                            }
                        )
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Delete?"),
                                message: Text("Do you want to delete this product from your favorite?"),
                                primaryButton: .destructive(Text("OK"), action: {
                                    if let indexSet = indexSet {
                                        favoriteProductViewModel.deleteFavoriteProduct(indexSet: indexSet)
                                    }
                                }),
                                secondaryButton: .cancel()
                            )
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            favoriteProductViewModel.getFavoriteProducts()
        }
    }
}
