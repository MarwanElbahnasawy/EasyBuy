//
//  DiscountCodesListViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 04/06/2023.
//

import Foundation

class DiscountCodesListViewModel: ObservableObject{
    @Published var discountCodes: DataDiscountCodes?
   

    func getDiscountCodesForListView(adType: AdType)-> [CodeDiscountNodesNode]?{
        let filteredArray: [CodeDiscountNodesNode] = discountCodes?.codeDiscountNodes?.nodes ?? []
        var resultArray: [CodeDiscountNodesNode] = []
        switch adType {
        case .men:
            resultArray =  filteredArray.filter({($0.codeDiscount?.codes?.nodes?.first?.code?.contains("MEN"))!})
        case .women:
            resultArray =  filteredArray.filter({($0.codeDiscount?.codes?.nodes?.first?.code?.contains("WOMEN"))!})
        case .all:
           resultArray =  filteredArray.filter({($0.codeDiscount?.codes?.nodes?.first?.code?.contains("EVERYTHING"))!})
        case .kids:
            resultArray =  filteredArray.filter({($0.codeDiscount?.codes?.nodes?.first?.code?.contains("KIDS"))!})
        }
        return resultArray
    }
    func getDiscountCodes(first: Int) {
        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query:GetAllDicountCodesQuery(first: first) , responseModel: DataDiscountCodes.self) { [weak self] result in
            switch result {
            case .success(let res):
                self?.discountCodes = res
                print(res)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
enum AdType{
    case men
    case women
    case all
    case kids
}
