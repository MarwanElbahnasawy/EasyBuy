//
//  OrdersInLine.swift
//  EasyBuy
//
//  Created by mo_fathy on 06/06/2023.
//

import SwiftUI

struct OrdersInLine: View {
    @ObservedObject var viewModel = OrdersViewModel()
    let rows = [
        GridItem(.fixed(150))
    ]
    var body: some View {
        VStack{
            if viewModel.ordersInLine.count == 0 {
                Text("No Orders Yet")
            }else{
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows:rows , alignment: .center, spacing: 4, pinnedViews: [], content: {
                        ForEach(viewModel.ordersInLine) { item in
                            OrderRow(order: item)
                        }
                    })
                }
            }
        }
    }
}

struct OrdersInLine_Previews: PreviewProvider {
    static var previews: some View {
        OrdersInLine()
    }
}
