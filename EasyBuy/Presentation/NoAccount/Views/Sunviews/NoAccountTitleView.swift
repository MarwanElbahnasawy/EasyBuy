import SwiftUI

struct NoAccountTitleView: View {
    var body: some View {
        VStack {
            Text("Welcome to EasyBuy")
                .largeTitle()
                .foregroundColor(.white)
                .padding(.bottom, 10)
        }
    }
}

struct NoAccountTitleView_Previews: PreviewProvider {
    static var previews: some View {
        NoAccountTitleView()
    }
}
