//
//  Network.swift
//  BeinSports
//
//  Created by mo_fathy on 01/05/2023.
//

//MARK: -  alamofire + decoder

import Alamofire
import Foundation

//MARK: - Route

enum Route {
    static let baseUrl = "https://api.apilayer.com/exchangerates_data/latest"
    static let APIkey = "mJrmv33HRbCXi3R2PgojWsjOYGbPmUih"
    case typy
    var description: String {
        switch self {
        case .typy:
            return"https://api.apilayer.com/exchangerates_data/latest?apikey=mJrmv33HRbCXi3R2PgojWsjOYGbPmUih"
        }
    }
}

class APIServices {
    private init() {}
    static let instance = APIServices()
    
    //MARK: - getDataAll
    
    func getDataAll<T: Decodable>(route: Route, method: HTTPMethod ,params: Parameters?, encoding: ParameterEncoding ,headers: HTTPHeaders? ,completion: @escaping (T?,  Error?)->()) {
        
        Alamofire.AF.request(route.description, method: method, parameters: params, encoding: encoding, headers: headers)
            .validate(statusCode: 200...300)
            .responseJSON { (response) in
                print(response)
                switch response.result {
                case .success(_):
                    guard let data = response.data else { return }
                    do {
                        let jsonData = try JSONDecoder().decode(T.self, from: data)
                        completion(jsonData,  nil)
                    } catch let jsonError {
                        print(jsonError)
                    }
                case .failure(let error):
                    completion(nil,  error)
                }
            }
    }
}






