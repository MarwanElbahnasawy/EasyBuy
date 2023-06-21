import SwiftUI

struct NoFavorites: View {
    var type = "Favorites"
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Spacer()
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.gray)
                .frame(width: 40, height: 40, alignment: .center)
                .padding(.bottom, 20)
            Text("No \(type) To Display")
                .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                .foregroundColor(Color.gray)
            Spacer()
        }
        .padding(.bottom, 10)
    }
}

struct NoFavorites_Previews: PreviewProvider {
    static var previews: some View {
        NoFavorites()
    }
}
