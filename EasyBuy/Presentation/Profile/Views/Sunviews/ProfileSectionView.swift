import SwiftUI

struct ProfileSectionView: View {
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
                    Text("Name")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, 4)
                    
                    Text("Email")
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
