import SwiftUI

struct NoAccountView: View {
    var body: some View {
        ZStack {
            Image("Register-Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Spacer()

                Image("YourLogoHere")
                    .resizable()
                    .frame(width: 200, height: 200)

                Text("Welcome to EasyBuy")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                Text("You don't have an account yet.")
                    .font(.headline)
                    .foregroundColor(.white)

                Spacer()

                HStack(spacing: 30) {
                    NavigationLink(destination: RegisterationView()) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(30)
                    }

                    NavigationLink(destination: LoginView()) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(30)
                    }
                }
            }
        }
    }
}

struct NoAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NoAccountView()
    }
}
