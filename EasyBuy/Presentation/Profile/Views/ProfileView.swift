import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    
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
                        if let customer = viewModel.customer?.data?.customerDetails {
                            Text(customer.displayName ?? "")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(customer.email ?? "")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
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
                    // TODO: Remove the token of the customer until they sign in again
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "Personal Details",
                                   tintColor: .black)
                }
                
                Button {
                    // TODO: Remove the token of the customer until they sign in again
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "My Orders",
                                   tintColor: .black)
                }
                
                Button {
                    print("Delete account")
                } label: {
                    SettingRowView(imageName: "xmark.circle.fill",
                                   title: "Settings",
                                   tintColor: .black)
                }
                
                
                Button {
                    // TODO: Remove the token of the customer until they sign in again
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "Sign Out",
                                   tintColor: .black)
                }
            }
            
            Section("Policy") {
                Button {
                    // TODO: Remove the token of the customer until they sign in again
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "FAQs",
                                   tintColor: .black)
                }
                
                Button {
                    // TODO: Remove the token of the customer until they sign in again
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "About Us",
                                   tintColor: .black)
                }
            }
        }
        .onAppear(perform: {
            viewModel.fetchCustomerDetails()
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
