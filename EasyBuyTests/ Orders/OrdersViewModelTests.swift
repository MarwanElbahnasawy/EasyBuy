//
//  OrdersViewModelTests.swift
//  EasyBuyTests
//
//  Created by mo_fathy on 22/06/2023.
//

import Foundation
import Apollo
import XCTest
@testable import EasyBuy

class OrdersViewModelTests: XCTestCase {
    
    var viewModel: OrdersViewModel!
    
    override func setUpWithError() throws {
        viewModel = OrdersViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchOrders() {
        let expectation = self.expectation(description: "Fetching orders")
        
        viewModel.fetchOrders()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertFalse(self.viewModel.orders.isEmpty)
            XCTAssertFalse(self.viewModel.ordersInLine.isEmpty)   
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testConvertToOrders() {
        let resOrder: [Edge] = [
            Edge(node: Order(id: "1")),
            Edge(node: Order(id: "2")),
            Edge(node: nil),
            Edge(node: Order(id: "3"))
        ]
        
        let orders = viewModel.convertToOrders(resOrder: resOrder)
        
        XCTAssertEqual(orders.count, 3)
        XCTAssertEqual(orders[0].id, "1")
        XCTAssertEqual(orders[1].id, "2")
        XCTAssertEqual(orders[2].id, "3")
    }
    
    func testSetOrderLine() {
        let orders: [Order] = [
            Order(id: "1"),
            Order(id: "2"),
            Order(id: "3")
        ]
        
        viewModel.setOrdderLine(orders: orders)
        
        XCTAssertEqual(viewModel.ordersInLine.count, 2)
        XCTAssertEqual(viewModel.ordersInLine[0].id, "1")
        XCTAssertEqual(viewModel.ordersInLine[1].id, "2")
        
        viewModel.setOrdderLine(orders: [Order(id: "1")])
        
        XCTAssertEqual(viewModel.ordersInLine.count, 1)
               XCTAssertEqual(viewModel.ordersInLine[0].id, "1")
    }
    
    func testFilterOrder() {
        let orders: [Order] = [
            Order(id: "1", displayFulfillmentStatus: "FULFILLED"),
            Order(id: "2", displayFulfillmentStatus: "UNFULFILLED"),
            Order(id: "3", displayFulfillmentStatus: "IN_PROGRESS"),
            Order(id: "4", displayFulfillmentStatus: "FULFILLED"),
            Order(id: "5", displayFulfillmentStatus: "UNFULFILLED")
        ]
        
        viewModel.filterOrdder(orders: orders)
        
        XCTAssertEqual(viewModel.successOrders.count, 2)
        XCTAssertEqual(viewModel.successOrders[0].id, "1")
        XCTAssertEqual(viewModel.successOrders[1].id, "4")
        
        XCTAssertEqual(viewModel.failureOrders.count, 2)
        XCTAssertEqual(viewModel.failureOrders[0].id, "2")
        XCTAssertEqual(viewModel.failureOrders[1].id, "5")
        
        XCTAssertEqual(viewModel.processingOrders.count, 1)
        XCTAssertEqual(viewModel.processingOrders[0].id, "3")
    }
}
