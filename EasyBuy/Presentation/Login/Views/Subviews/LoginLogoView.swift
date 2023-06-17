import SwiftUI

struct LoginLogoView: View {
    var body: some View {
        Image("Shopify-Symbol")
            .resizable()
            .scaledToFit()
            .padding(.vertical, 32)
    }
}

struct LoginLogoView_Previews: PreviewProvider {
    static var previews: some View {
        LoginLogoView()
    }
}
