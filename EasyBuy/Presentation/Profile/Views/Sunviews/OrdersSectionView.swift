import SwiftUI

struct OrdersSectionView: View {
    var body: some View {
        Section("Orders") {
            VStack{
                HStack{
                    NavigationLink(destination: OrdersView()){
                        Spacer()
                        Text("VIEW ALL")
                            .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                            .foregroundColor(.red)
                            .padding(.trailing, 15)
                    }
                }
                OrdersInLine()
            }
        }
    }
}

struct OrdersSectionView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersSectionView()
    }
}
