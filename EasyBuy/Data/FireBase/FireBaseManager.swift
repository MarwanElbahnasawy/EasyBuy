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
        print("customer firebase id is \(UserDefaults.standard.string(forKey:"customerID"))")
        let customer = db.collection(NetworkConstants.CustomerDiscountCodes).document(UserDefaults.standard.string(forKey:"customerID") ?? "anycustomer")
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
        print("customer firebase id is \(UserDefaults.standard.string(forKey:"customerID"))")
        let customer = db.collection(NetworkConstants.CustomerDiscountCodes).document(UserDefaults.standard.string(forKey:"customerID") ?? "")
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
    func removeCartFromFireBase() {
        db.collection(NetworkConstants.CustomerDiscountCodes)
            .document(UserDefaults.standard.string(forKey:"customerID") ?? "anycustomer")
            .updateData(["draftOrders.cartDraftOrder": FieldValue.delete()]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
        }
    }

    func removeFavoriteFromFireBase() {
        db.collection(NetworkConstants.CustomerDiscountCodes)
            .document(UserDefaults.standard.string(forKey:"customerID") ?? "anycustomer")
            .updateData(["draftOrders.favoriteDraftorder": FieldValue.delete()]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
        }
    }

//    func removeCartFromFireBase(){
//        db.collection(NetworkConstants.CustomerDiscountCodes).document(firebaseCustomerID!).updateData(["draftOrders":FieldValue.arrayRemove(["cartDraftOrder"])]){
//            err in
//                if let err = err {
//                    print("Error updating document: \(err)")
//                } else {
//                    print("Document successfully updated")
//                }
//        }
//    }
//    func removeFavoriteFromFireBase(){
//        db.collection(NetworkConstants.CustomerDiscountCodes)
//            .document(firebaseCustomerID!)
//            .updateData(
//                ["draftOrders":FieldValue.arrayRemove(
//                    ["favoriteDraftorder"]
//                )]
//            ) { err in
//                if let err = err {
//                    print("Error updating document: \(err)")
//                } else {
//                    print("Document successfully updated")
//                }
//        }
//    }
}
