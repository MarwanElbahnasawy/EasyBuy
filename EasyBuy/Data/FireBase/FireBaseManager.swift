//
//  FireBaseManager.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 04/06/2023.
//

import Foundation
import FirebaseFirestore

class FireBaseManager{
    let db = Firestore.firestore()
    static let shared = FireBaseManager()
    private init(){
    }
    func saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes){
        let customer = db.collection(NetworkConstants.CustomerDiscountCodes).document(customerDiscountCodes.id!)
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(customerDiscountCodes)
            let json = (try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any])!
            customer.setData(json)
        }catch{
            print("Could't convert data")
        }
        
    }
    func retriveCustomerDiscountCodes(id: String) -> DocumentReference? {
        let customer = db.collection(NetworkConstants.CustomerDiscountCodes).document(id)
        return customer
    }
}
