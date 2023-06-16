import SwiftUI

struct AboutUsView: View {
    @ObservedObject var viewModel = AboutUsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("About Us")
                    .font(.title)
                    .bold()
                
                Text(viewModel.aboutText)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                ForEach(viewModel.developers, id: \.name) { developer in
                    DeveloperView(developer: developer)
                }
            }
            .padding()
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
