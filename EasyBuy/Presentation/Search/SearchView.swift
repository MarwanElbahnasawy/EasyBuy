import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = HomeViewModel()
    @State var products: [Product]?
    @State private var searchText = ""
    @State private var isSearching = false

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Spacer()
                SearchBar(text: $searchText, isEditing: $isSearching)
                    .transition(.move(edge: .top))

                Spacer()

                var filteredProducts: [Product] {
                    if searchText == " " {
                        return []
                    } else if searchText.isEmpty{
                        return products ?? []
                    } else {
                        return products?.filter { product in
                            guard let title = product.title else { return false }
                            return title.lowercased().contains(searchText.lowercased())
                        } ?? []
                    }
                }
                
                LazyVGrid(columns: gridLayout) {
                    ForEach(filteredProducts) { product in
                        ProductCell(product: product)
                    }
                }
            }.onAppear{
                viewModel.fetchProducts()
            }
        }
        .onAppear(perform: {
            products = viewModel.items ?? []
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
