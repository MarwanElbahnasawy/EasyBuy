//  BeinSports
//
//  Created by mo_fathy on 06/05/2023.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case currency
        case numCurrency
    }
    
    var currency: String? {
          get {
              string(forKey: UserDefaultsKeys.currency.rawValue)
          }
          
          set {
              setValue(newValue, forKey: UserDefaultsKeys.currency.rawValue)
          }
      }
    var numCurrency: Double? {
          get {
              double(forKey: UserDefaultsKeys.numCurrency.rawValue)
          }
          
          set {
              setValue(newValue, forKey: UserDefaultsKeys.numCurrency.rawValue)
          }
      }
}
