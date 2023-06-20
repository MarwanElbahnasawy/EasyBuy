//
//  DiscountCodesListViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 04/06/2023.
//

import Foundation

class DiscountCodesListViewModel: ObservableObject{
    @Published var discountCodes: DataDiscountCodes?
    @Published var notUsedDiscountCodes: [CodeDiscountNodesNode] = []

    func getDiscountCodesForListView(adType: AdType)-> [CodeDiscountNodesNode]?{
        let filteredArray: [CodeDiscountNodesNode] = notUsedDiscountCodes
        var resultArray: [CodeDiscountNodesNode] = []
        switch adType {
        case .men:
            resultArray =  filteredArray.filter({($0.codeDiscount?.codes?.nodes?.first?.code?.contains("MEN"))!})
        case .women:
            resultArray =  filteredArray.filter({($0.codeDiscount?.codes?.nodes?.first?.code?.contains("WOMEN"))!})
        case .all:
           resultArray =  filteredArray.filter({($0.codeDiscount?.codes?.nodes?.first?.code?.contains("EVERYTHING"))!})
        case .shoes:
            resultArray =  filteredArray.filter({($0.codeDiscount?.codes?.nodes?.first?.code?.contains("ADIDAS"))!})
        }
        return resultArray
    }
    func getDiscountCodes(first: Int) {
        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query:GetAllDiicountCodesQuery(first: first) , responseModel: DataDiscountCodes.self) { [weak self] result in
            switch result {
            case .success(let res):
                self?.discountCodes = res
                self?.returnUnusedArray()
                print(res)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    func returnUnusedArray(){
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument {[weak self] snapshot, error in
              if let error = error {
                  print("Failed to fetch current user:", error)
                  return
              }

              guard let data = snapshot?.data() else {
                      print("No data found")
                  return
              }
            let objFromFireBase = FireBaseManager.shared.mapFireBaseObject(data: data)
            if let usedCodes = objFromFireBase?.usedDiscountCodes{
                self?.notUsedDiscountCodes = self?.discountCodes?.codeDiscountNodes?.nodes?.filter({ node in
                    !usedCodes.contains(node.codeDiscount?.codes?.nodes?.first?.code ?? "")
                }) ?? []
            }
            else{
                self?.notUsedDiscountCodes = self?.discountCodes?.codeDiscountNodes?.nodes ?? []
            }
//            if let unusedCodes = self?.discountCodes?.codeDiscountNodes?.nodes{
//
//                for unusedCode in unusedCodes{
//                    if let code =  unusedCode.codeDiscount?.codes?.nodes?.first?.code {
//                        if let usedCodes = objFromFireBase?.usedDiscountCodes{
//                            for usedCode in usedCodes {
//                                if code != usedCode {
//                                    self?.notUsedDiscountCodes.append(unusedCode)
//                                }
//                            }
//                        }
//                        else{
//                            self?.notUsedDiscountCodes = unusedCodes
//                            return
//                        }
//                    }
//                }
//                print(" self?.notUsedDiscountCodes is \(self?.notUsedDiscountCodes ?? [])")
//            }
//            else{
//                self?.notUsedDiscountCodes =  self?.discountCodes?.codeDiscountNodes?.nodes ?? []
//            }

          
          }
    }
}
enum AdType{
    case men
    case women
    case all
    case shoes
}
