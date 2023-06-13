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
    let firebaseCustomerID = UserDefaults.standard.string(forKey:"customerID")
    private init(){
    }
    func saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes){
        let customer = db.collection(NetworkConstants.CustomerDiscountCodes).document(firebaseCustomerID!)
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(customerDiscountCodes)
            let json = (try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any])!
            customer.setData(json)
        }catch{
            print("Could't convert data")
        }
        
    }
    func retriveCustomerDiscountCodes() -> DocumentReference? {
        let customer = db.collection(NetworkConstants.CustomerDiscountCodes).document(firebaseCustomerID ?? "")
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
    func removeCartFromFireBase(){
        db.collection(NetworkConstants.CustomerDiscountCodes).document(firebaseCustomerID!).updateData(["draftOrders":FieldValue.arrayRemove(["cartDraftOrder"])]){
            err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
        }
    }
}
