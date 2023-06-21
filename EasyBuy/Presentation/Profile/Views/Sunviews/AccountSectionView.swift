import SwiftUI

struct AccountSectionView: View {
    @Binding var confirmingSignOut: Bool
    
    var body: some View {
        Section("Account") {
            NavigationLink(destination: AddressView()) {
                SettingRowView(imageName: "location.circle.fill", title: "My Address", tintColor: .black)
            }
            
            NavigationLink(destination: SettingsView()) {
                SettingRowView(imageName: "gearshape.circle.fill", title: "Settings", tintColor: .black)
            }
            
            Button {
                confirmingSignOut = true
                
            } label: {
                SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .black)
            }
        }
    }
}
