import SwiftUI

struct ProfileView: View {
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
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "Personal Details",
                                   tintColor: .black)
                }
                
                Button {
                    
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "My Orders",
                                   tintColor: .black)
                }
                
                Button {
                    
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "Settings",
                                   tintColor: .black)
                }
                
                
                Button {
                    UserDefaults.standard.removeObject(forKey: "accessToken")
                    // TODO: Navigate to sign in view or home screen
                    print("Navigate to sign in view or home screen")
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "Sign Out",
                                   tintColor: .black)
                }
            }
            
            Section("Policy") {
                Button {
                    
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "FAQs",
                                   tintColor: .black)
                }
                
                Button {
                    
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
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
            print("current token is \(customerID ?? "")")
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
