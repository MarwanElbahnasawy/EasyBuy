//
//  OrdersViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 05/06/2023.
//

import Foundation
class OrdersViewModel: ObservableObject  {
    let resOrder : ResOrder = Bundle.main.decode("orders.json")
    @Published var iserror: Bool = false
    @Published var isLoading: Bool = true
    @Published var orders : [Order] = []
    @Published var successOrders : [Order] = []
    @Published var processingOrders : [Order] = []
    @Published var failureOrders : [Order] = []
    @Published var ordersInLine : [Order] = []
    init() {
        fetchProducts()
    }
    
    func fetchProducts(){
        isLoading = false
        self.orders = resOrder.orders
        setOrdderLine(orders: self.orders)
        filterOrdder(orders: self.orders)
    }
    
    func setOrdderLine(orders : [Order]){
        if(orders.count > 2){
            for i in 0...1 {
                ordersInLine.append(orders[i])
            }
            
        }else{
            ordersInLine = orders
        }
    }

    func filterOrdder(orders : [Order]){
        successOrders = orders.filter { $0.fulfillments?.first?.status == "success" }
        failureOrders = orders.filter { $0.fulfillments?.first?.status == "failure" }
        processingOrders = orders.filter { $0.fulfillments?.first?.status == "Processing" }
    }
}

