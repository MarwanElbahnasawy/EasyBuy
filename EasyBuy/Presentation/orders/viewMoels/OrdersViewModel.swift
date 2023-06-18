//
//  OrdersViewModel.swift
//  EasyBuy
//
//  Created by mo_fathy on 05/06/2023.
//

import Foundation
class OrdersViewModel: ObservableObject  {
    @Published var iserror: Bool = false
    @Published var isLoading: Bool = true
    @Published var orders : [Order] = []
    @Published var successOrders : [Order] = []
    @Published var processingOrders : [Order] = []
    @Published var failureOrders : [Order] = []
    @Published var ordersInLine : [Order] = []
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders(){
        guard let email = UserDefaults.standard.string(forKey: "email") else { return }
        let mail = "email:\(email)"
        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query:GetOrdersQuery(first: 10,query: mail) , responseModel: ResOrder.self, completion: { result in
                            switch result {
                            case .success(let success):
                                self.isLoading = false
                                self.orders = self.convertToOrders(resOrder:success.orders?.edges ?? [] )
                                self.setOrdderLine(orders: self.orders)
                                self.filterOrdder(orders: self.orders)
                            case .failure(let failure):
                                print(failure)
                            }
                        })
        
       
    }
    
    func convertToOrders (resOrder: [Edge] ) -> [Order]{
        var orders : [Order] = []
        for order in resOrder  {
            if let order = order.node {
                orders.append(order)
            }
        }
       return orders
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
        successOrders = orders.filter { $0.displayFulfillmentStatus == "FULFILLED" }
        failureOrders = orders.filter { $0.displayFulfillmentStatus == "UNFULFILLED" }
        processingOrders = orders.filter { $0.displayFulfillmentStatus == "IN_PROGRESS" }
    }
}

