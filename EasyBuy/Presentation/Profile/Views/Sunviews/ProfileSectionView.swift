import SwiftUI

struct ProfileSectionView: View {
    @AppStorage("email") var email: String?
    @AppStorage("displayName") var displayName: String?
  
    var body: some View {
        Section {
            HStack {
                Image("Shopify-Symbol")
                    .resizable()
                    .scaledToFit()
                    .font(.title)
                    .frame(width: 72, height: 72)
                    .background(Color(.systemGray3))
                    .clipShape(Circle())
                
                VStack {
                    Text(displayName ?? "")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, 4)
                    
                    Text(email ?? "")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct ProfileSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSectionView()
    }
}
