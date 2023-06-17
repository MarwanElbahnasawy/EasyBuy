import SwiftUI

struct ProductTitleView: View {
    @AppStorage("token") var token: String?
    let title: String
    let productType: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(productType)
            }
            
            Spacer()
            
            if token == "guest" || token == "" {
                NavigationLink {
                    NoAccountView()
                } label: {
                    Image(systemName: "heart")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }
            } else {
                Button(action: action) {
                    Image(systemName: "heart")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }
            }
        }
    }
}
