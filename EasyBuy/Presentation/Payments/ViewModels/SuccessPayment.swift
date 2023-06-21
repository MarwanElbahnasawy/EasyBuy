//
//  SuccessPayment.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 21/06/2023.
//

import Foundation

class SuccessPayment: ObservableObject{
    @Published var isSuccess = false
    @Published var showAlert = false
    @Published var isLoading = false
    @Published var isComplete = false
    func completeOrder(draftOrderID: String) async{
        print("the draft order is \(draftOrderID)")
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderCompleteMutation(id: draftOrderID), responseModel: DraftOrderCompleteDataClass.self) {[weak self]result in
            switch result {
            case .success(let success):
                print(success)
                self?.isLoading = false
                self?.isComplete = true
                DispatchQueue.main.asyncAfter(deadline: .now()+2){[weak self] in
                    self?.showAlert = false
                    DispatchQueue.main.async{[weak self] in
                        self?.isSuccess = true
                    }
                }
               
            case .failure(let failure):
                print(failure)
            }
        }
    }
    func draftOrderDelete(){
        UserDefaults.standard.set(0, forKey: "count")
        UserDefaults.standard.synchronize()
        FireBaseManager.shared.removeCartFromFireBase()
    }
}
