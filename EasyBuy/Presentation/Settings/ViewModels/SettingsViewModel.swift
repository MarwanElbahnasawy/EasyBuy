//
//  SettingsViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 16/06/2023.
//

import Foundation

class SettingsViewModel: ObservableObject{
    @Published var customerAddress: CustomerAddress?
    
    func saveAddress(){
        let encoder = JSONEncoder()
        let encodedPerson = try? encoder.encode(customerAddress)
        UserDefaults.standard.set(encodedPerson, forKey: "Address")
    }
    func getAddress(){
        guard let data = UserDefaults.standard.data(forKey: "Address") else{return}
        let decoder = JSONDecoder()
        let address = (try? decoder.decode(CustomerAddress.self, from: data)) ?? CustomerAddress()
        customerAddress = address
    }
    func getCurrencyCode(){
        
    }
    func saveCurrencyCode(){
        
    }
}
