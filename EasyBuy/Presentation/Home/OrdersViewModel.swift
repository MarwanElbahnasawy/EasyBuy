//
//  OrdersViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 05/06/2023.
//

import Foundation
class OrdersViewModel: ObservableObject  {
    let resOrder : ResOrder = Bundle.main.decode("orders.json")
    @Published var orders : [Order] = []
   
    
    init() {
        self.orders = resOrder.orders
    }
    
}
