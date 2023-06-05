import SwiftUI

struct OrdersView: View {
    @ObservedObject var viewModel = OrdersViewModel()
    
    @State private var selectorIndex = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color("secColorBackground"))
            }
            .padding(.leading, 10)
            .frame(width: 40, height: 40)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("My Orders")
                .font(.headline)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    var body: some View {
        ZStack{
            VStack {
                NavigationBarView()
                Picker("", selection: $selectorIndex) {
                    Text("Delivered").tag(0)
                    Text("Processing").tag(1)
                    Text("Cancelled").tag(2)
                }
                .pickerStyle(.segmented)
                .padding([.horizontal, .vertical], 10)
                .accentColor(.red)
                if selectorIndex == 0 {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 10) {
                            if(viewModel.successOrders.count == 0){
                                NoProducts(type: "Orders")
                            }else{
                                ForEach(viewModel.successOrders, id: \.id) { order in
                                    OrderRow(order: order, selectorIndex: self.selectorIndex)
                                    LineView()
                                }
                            }
                        }
                        .padding(.horizontal, 15)
                        
                    })
                } else if selectorIndex == 1 {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 10) {
                            if(viewModel.processingOrders.count == 0){
                                NoProducts(type: "Orders")
                            }else{
                                ForEach(viewModel.processingOrders, id: \.id) { order in
                                    OrderRow(order: order, selectorIndex: self.selectorIndex)
                                    LineView()
                                }
                            }
                        }
                        .padding(.horizontal, 15)
                        
                    })
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 10) {
                            if(viewModel.failureOrders.count == 0){
                                NoProducts(type: "Orders")
                            }else{
                                ForEach(viewModel.failureOrders, id: \.id) { order in
                                    OrderRow(order: order, selectorIndex: self.selectorIndex)
                                    LineView()
                                }
                            }
                        }
                        .padding(.horizontal, 15)
                    })
                }
            }
        }.background(MotionAnimationView())
    }
}



struct MyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}



