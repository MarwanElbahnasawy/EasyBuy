//
//  DicountCodeCellViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 04/06/2023.
//

import Foundation

class DiscountCodeViewModel : ObservableObject{
    var discountCode: CodeDiscountNodesNode?
    var title: String
    var summury: String
    var code: String
    @Published var isUsed: Bool = false
    @Published var adType: AdType = .all
    init(discountCode: CodeDiscountNodesNode?, adType: AdType) {
        self.discountCode = discountCode
        self.title = discountCode?.codeDiscount?.title ?? ""
        self.summury = discountCode?.codeDiscount?.summary ?? ""
        self.code = discountCode?.codeDiscount?.codes?.nodes?.first?.code ?? ""
        self.adType = adType
    }
    func isExist(id: String,customerCode: String){
        FireBaseManager.shared.retriveCustomerDiscountCodes(id: id)?.getDocument {[weak self] snapshot, error in
              guard let data = snapshot?.data() else {
                      print("No data found")
                  return
              }
            let discountCodes = data["discountCodes"] as? [String] ?? []
            if discountCodes.contains(customerCode){
                self?.isUsed = true
                print("found")
            }
          }
    }
    func getImageName() -> String {
        var image = ""
        switch adType {
        case .men:
            image = "MEN"
        case .women:
            image = "image cop"
        case .all:
            image = "Everything"
        case .kids:
            image = "KIDS"
        }
        return image
    }
    
    func saveCodeForCustomer(id: String,customerCode: String){
        isUsed = true
      FireBaseManager.shared.retriveCustomerDiscountCodes(id: id)?.getDocument { snapshot, error in
            if let error = error {
                print("Failed to fetch current user:", error)
                return
            }

            guard let data = snapshot?.data() else {
                    print("No data found")
                FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: id, discountCodes: [customerCode]))
                
                return
            }
          
    let id = data["id"] as? String ?? ""
    var discountCodes = data["discountCodes"] as? [String] ?? []
          if discountCodes.contains(customerCode) == false{
              discountCodes.append(customerCode)
              print(discountCodes)
              let codes = CustomerDiscountCodes(id: id, discountCodes: discountCodes)
              FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: codes)
              print("pressed")
          }
        }
    }
}
