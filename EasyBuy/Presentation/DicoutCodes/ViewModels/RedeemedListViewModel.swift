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
            self?.codes = FireBaseManager.shared.mapFireBaseObject(data: data)
                print(self?.codes?.discountCodes ?? "default")
        }
    }
    
//    func deleteDiscountCode(index: String) {
//        let discountCodes: [String] = codes?.discountCodes ?? []
//        codes?.discountCodes = discountCodes.filter { $0 != index }
//        print(discountCodes)
//        FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: codes ?? CustomerDiscountCodes())
//    }
    
}
