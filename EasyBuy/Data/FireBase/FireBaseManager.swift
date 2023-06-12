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
    let customerID = UserDefaults.standard.string(forKey:"shopifyCustomerID")
    let firebaseCustomerID = UserDefaults.standard.string(forKey:"customerID")
    private init(){
    }
    func saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes){
        let customer = db.collection(NetworkConstants.CustomerDiscountCodes).document(customerID!)
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
    func mapFireBaseObject(data: [String : Any]) -> CustomerDiscountCodes?{
        var customerFirebase: CustomerDiscountCodes = CustomerDiscountCodes()
        do {
            let data = try JSONSerialization.data(withJSONObject: data, options: [])
            customerFirebase = try JSONDecoder().decode(CustomerDiscountCodes.self, from: data)
            // Use the Codable object
        } catch {
            print(error.localizedDescription)
        }
        
        return customerFirebase
    }
}
