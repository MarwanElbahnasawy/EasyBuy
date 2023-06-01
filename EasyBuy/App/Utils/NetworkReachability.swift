//
//  NetworkReachability.swift
//  EasyBuy
//
//  Created by Marwan Elbahnasawy on 01/06/2023.
//

import Foundation
import Network

class NetworkReachability: ObservableObject {
    @Published private(set) var reachable: Bool = false
    private let monitor = NWPathMonitor()
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.reachable = path.status == .satisfied
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
}
