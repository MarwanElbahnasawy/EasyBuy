import SwiftUI

struct GuestButtonView: View {
    @Binding var token: String?
    @AppStorage("email") var email: String?
    @AppStorage("displayName") var displayName: String?
    
    var body: some View {
        Button {
            displayName = "Guest"
            token = "guest"
        } label: {
            HStack {
                Text("GUEST")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color.black)
        .cornerRadius(10)
        .padding(.top, 24)
    }
}
