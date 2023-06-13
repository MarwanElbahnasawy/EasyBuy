//
//  RedeemedCellViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 05/06/2023.
//

import Foundation

class RedeemedListViewModel: ObservableObject{
    @Published var codes: CustomerDiscountCodes?
    func getRedeemedCode(id: String) {
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument {[weak self] snapshot, error in
            if let error = error {
                print("Failed to fetch current user:", error)
                return
            }
            
            guard let data = snapshot?.data() else {
                print("No data found")
                return
            }
            let codecust = data["discountCodes"] as? [String] ?? []
            self?.codes = CustomerDiscountCodes(id: id, discountCodes: codecust)
            print(codecust)
                print(self?.codes?.discountCodes ?? "default")
        }
    }
}
