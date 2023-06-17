import SwiftUI

struct BackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.white)
                .padding(8)
                .background(Color.black)
                .cornerRadius(8.0)
                .aspectRatio(1, contentMode: .fit)
        }
    }
}
