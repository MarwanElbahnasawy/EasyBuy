import SwiftUI

struct ProfileView: View {
    @State private var confirmingSignOut = false
    @AppStorage("token") var token: String?
    var body: some View {
        List {
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

            Section("General") {
                HStack {
                    SettingRowView(imageName: "gear",
                                   title: "Version",
                                   tintColor: Color(.systemGray))

                    Spacer()

                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }

            Section("Account") {

                Button {
                    
                } label: {
                    SettingRowView(imageName: "bag.circle.fill",
                                   title: "My Orders",
                                   tintColor: .black)
                }

                Button {

                } label: {
                    SettingRowView(imageName: "gearshape.circle.fill",
                                   title: "Settings",
                                   tintColor: .black)
                }


                Button {
                    confirmingSignOut = true
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "Sign Out",
                                   tintColor: .black)
                }
            }

            Section("Policy") {
                Button {

                } label: {
                    SettingRowView(imageName: "exclamationmark.circle.fill",
                                   title: "FAQs",
                                   tintColor: .black)
                }

                Button {

                } label: {
                    SettingRowView(imageName: "checkmark.shield.fill",
                                   title: "About Us",
                                   tintColor: .black)
                }
            }
        }
        .onAppear(perform: {
            //            viewModel.fetchCustomerDetails()
            let token = UserDefaults.standard.string(forKey: "accessToken")
            print("current token is \(token ?? "")")

            let customerID = UserDefaults.standard.string(forKey: "customerID")
            print("current customerID is \(customerID ?? "")")
        })
        .alert(isPresented: $confirmingSignOut) {
            Alert(title: Text("Sign out?"),
                  message: Text("Are you sure you want to sign out?"),
                  primaryButton: .destructive(Text("Sign Out")) {
                      UserDefaults.standard.removeObject(forKey: "accessToken")
                      UserDefaults.standard.removeObject(forKey: "customerID")

                      // Navigate to NoAccountView
//                      UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: Home())
                token = ""
                  },
                  secondaryButton: .cancel())
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
