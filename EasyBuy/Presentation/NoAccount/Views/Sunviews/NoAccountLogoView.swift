import SwiftUI

struct NoAccoutLogoView: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(height: 200)
    }
}
