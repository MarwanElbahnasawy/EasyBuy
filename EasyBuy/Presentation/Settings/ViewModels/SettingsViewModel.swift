//
//  SettingsViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 16/06/2023.
//

import Foundation
import Alamofire

class SettingsViewModel: ObservableObject{
    @Published var customerAddress: CustomerAddress?
    @Published var rates: [String:Double] = [:]
    @Published var currencyCodes: [String] = []
    @Published var selectedCodeValue: Double = 0
    @Published var currencyCode: String = (UserDefaults.standard.currency ?? "USD")
    func saveAddress(){
        let encoder = JSONEncoder()
        do{
            let encodedPerson = try encoder.encode(customerAddress)
            UserDefaults.standard.set(encodedPerson, forKey: "Address")
            }
            catch{
                print("couldn't decode data")
            }
    }
    func getAddress(){
        guard let data = UserDefaults.standard.data(forKey: "Address") else{return}
        let decoder = JSONDecoder()
        let address = (try? decoder.decode(CustomerAddress.self, from: data)) ?? CustomerAddress()
        customerAddress = address
    }
    func getCurrency(base :String = UserDefaults.standard.currency ?? "USD"){
        let param : [String: String] = ["base": base]
        APIServices.instance.getDataAll(route: .typy, method: .get, params: param, encoding: URLEncoding.default, headers: nil) { [weak self] (dataurl: Root?, error) in
            self?.rates = dataurl?.rates ?? [:]
            dataurl?.rates.forEach({ (key: String, value: Double) in
                self?.currencyCodes.append(key)
                if(key == UserDefaults.standard.currency){
                    UserDefaults.standard.numCurrency = value
                    self?.selectedCodeValue = value
                }
            })
        }
    }

    func saveCurrencyCode(code: String){
        UserDefaults.standard.currency = code
        UserDefaults.standard.numCurrency = selectedCodeValue
    }
}
