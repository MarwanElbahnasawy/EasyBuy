import SwiftUI

struct SizesView: View {
    let variants: [VariantsEdge]?
    @ObservedObject var viewModel: ProductViewModel
    @State private var selectedItem: VariantsEdge?
    
    var body: some View {
        if let variants = variants {
            Text("Sizes")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            // Group the variants into arrays of 4 sizes
            let groupedVariants = variants.chunked(into: 4)
            
            // Use LazyVGrid to display the sizes in a grid layout
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 4), spacing: 8) {
                ForEach(groupedVariants.indices, id: \.self) { rowIndex in
                    let rowVariants = groupedVariants[rowIndex]
                    
                    Group {
                        ForEach(rowVariants, id: \.node?.id) { sizeOption in
                            Text(sizeOption.node?.title?.split(separator: "/").first ?? "not available")
                                .foregroundColor(.black)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .frame(width: 60, height: 40)
                                .background(self.selectedItem?.node?.id == sizeOption.node?.id ? Color(uiColor: .lightGray): Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .onAppear{
                                    selectedItem = variants.first
                                    viewModel.varaintID = selectedItem?.node?.id
                                }
                                .onTapGesture {
                                    selectedItem = sizeOption
                                    viewModel.varaintID = selectedItem?.node?.id
                                    viewModel.getAvailableQuantityForProduct()
                                    viewModel.quantity = 1
                                }
                        }
                    }
                }
                .onAppear{
                    selectedItem = variants.first
                    
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
        }
    }
}

// Helper extension to chunk an array into subarrays
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
