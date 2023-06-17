import SwiftUI

struct NoAccountView: View {
    var body: some View {
        VStack {
            Spacer()
            
            NoAccountLogoView(imageName: "YourLogoHere")
                .frame(height: 200)
            
            Text("Welcome to EasyBuy")
                .largeTitle()
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Text("You don't have an account yet.")
                .headline()
                .foregroundColor(.white)
                .padding(.bottom, 30)
            
            VStack(spacing: 30) {
                NavigationLinkView(destination: RegisterationView(), label: "Sign Up")
                    .buttonStyle(RoundedButtonStyle())
                
                NavigationLinkView(destination: LoginView(), label: "Sign In")
                    .buttonStyle(RoundedButtonStyle())
            }
            
            Spacer()
        }
        .background(
            Image("Register-Background")
                .resizable()
                .scaledToFill()
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct NoAccountLogoView: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
    }
}

struct NavigationLinkView<Destination: View>: View {
    var destination: Destination
    var label: String
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(label)
                .foregroundColor(.black)
                .frame(width: 300)
        }
    }
}

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.white)
            .cornerRadius(10)
    }
}

struct NoAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NoAccountView()
    }
}
