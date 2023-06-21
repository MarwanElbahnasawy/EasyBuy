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
    @Published var isLoading = true
  
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
                self?.isLoading = false
                
                print(failure)
            }
        }
    }
    func returnUnusedArray(){
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument {[weak self] snapshot, error in
            self?.isLoading = false
              if let error = error {
                  print("Failed to fetch current user:", error)
                  self?.notUsedDiscountCodes = self?.discountCodes?.codeDiscountNodes?.nodes ?? []
                  return
              }

              guard let data = snapshot?.data() else {
                      print("No data found")
                  self?.notUsedDiscountCodes = self?.discountCodes?.codeDiscountNodes?.nodes ?? []
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
          
          }
    }
}
enum AdType{
    case men
    case women
    case all
    case shoes
}
