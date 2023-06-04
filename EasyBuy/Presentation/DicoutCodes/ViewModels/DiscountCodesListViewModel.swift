//
//  DiscountCodesListViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 04/06/2023.
//

import Foundation

class DiscountCodesListViewModel: ObservableObject{
    @Published var discountCodes: DataDiscountCodes?
    
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
