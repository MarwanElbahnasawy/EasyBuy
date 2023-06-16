import SwiftUI

struct DeveloperView: View {
    var developer: Developer
    
    var body: some View {
        VStack(spacing: 8) {
            Image(developer.photoName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .cornerRadius(60)
            
            Text(developer.name)
                .font(.headline)
                .bold()
        }
    }
}
