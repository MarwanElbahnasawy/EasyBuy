import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = HomeViewModel()
    @State private var searchText = ""
    @State private var isSearching = false

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Spacer()
                SearchBar(text: $searchText, isEditing: $isSearching)
                    .transition(.move(edge: .top))

                Spacer()

                if viewModel.items?.isEmpty == false {
                    LazyVGrid(columns: gridLayout, spacing: 15) {
                        ForEach(viewModel.items?.filter {
                            searchText.isEmpty ? true : $0.title!.lowercased().contains(searchText.lowercased())
                        } ?? []) { product in
                            ProductCell(product: product)
                        }
                    }
                    .padding(.horizontal, 15)
                    .transition(.move(edge: .leading))
                } else if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text("No results found")
                        .foregroundColor(.gray)
                        .padding()
                        .transition(.opacity)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
