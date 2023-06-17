import SwiftUI

struct GeneralSectionView: View {
    var body: some View {
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
    }
}

struct GeneralSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSectionView()
    }
}
