//
//  AddressViewModel.swift
//  final test
//
//  Created by mo_fathy on 13/06/2023.
//

import Foundation
import CoreLocation
import MapKit
import LocalAuthentication

 class AddressViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var bindResultToViewController : (()->()) = {}
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @Published var locations: [Location] = []
    @Published var address: [CustomerAddress] = []
    @Published var iserror: Bool = false
    @Published var isLoading: Bool = true
    @Published var selectedPlace: Location?
    @Published var selectorIndex = 0
    let manager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
     var placemark: CLPlacemark!{
        didSet {
            bindResultToViewController()
            self.mapRegion = {
                let mapCoordinates = CLLocationCoordinate2D(latitude: location?.latitude ?? 0 , longitude: location?.longitude ?? 0 )
                let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                let mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
                
                return mapRegion
            }()
        }
    }
    
    override init() {
        super.init()
        featchAddress()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    func requestLocation() {
        manager.requestLocation()
    }
     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
          if let clErr = error as? CLError {
              switch clErr.code {
              case .denied:
                  print("Location access denied")
              case .network:
                  print("Network error")
              case .locationUnknown:
                  print("Location unknown")
              default:
                  print("Other error")
              }
          } else {
              print("Error: \(error.localizedDescription)")
          }
      }
  
   
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: location!.latitude, longitude: location!.longitude)
        geoCoder.reverseGeocodeLocation(location) {[weak self] (placemarks, error) -> Void in
            guard let self = self else { return }
            guard let placeMark = placemarks?.first else { return }
            self.placemark = placeMark
          
        }
        manager.stopUpdatingLocation()
        self.mapRegion = {
            let mapCoordinates = CLLocationCoordinate2D(latitude: location.coordinate.latitude , longitude: location.coordinate.longitude )
            let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
            
            return mapRegion
        }()
        
    }
    func addLocation() {
        let newLocation = Location(id: UUID(), name: "location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: newLocation.latitude, longitude: newLocation.longitude)
        geoCoder.reverseGeocodeLocation(location) {[weak self] (placemarks, error) -> Void in
            guard let self = self else { return }
            guard let placeMark = placemarks?.first else { return }
            self.placemark = placeMark
            
        }
        locations = []
        locations.append(newLocation)
        
    }
    
    func validatePhoneNumber(value: String) -> Bool {
        let PHONE_REGEX = "^01[0125][0-9]{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    func addAddress(address1: String,address2: String,city: String,country: String,phone: String,zip: String ){
        guard let token = UserDefaults.standard.string(forKey: "accessToken") else { return }
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation:  CustomerAddressCreateMutation(customerAccessToken: token, address: MailingAddressInput(address1: address1, address2: address2, city: city, country: country , phone: phone, zip: zip)), responseModel: ResAddress.self, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.featchAddress()
                print(" create customerAddress : \(response.customerAddressCreate?.customerAddress?.address1 ?? "")")
            case .failure(let error):
                print("Failed to create access token: \(error)")
            }
        })
    }
    func featchAddress(){
        guard let token = UserDefaults.standard.string(forKey: "accessToken") else { return }
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query:QueryGetAddressQuery(customerAccessToken: token,first: 20) , responseModel: DataClassAddress.self, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.address = success.customer?.addresses?.nodes ?? []
                let customerIDOj = (success.customer?.displayName ?? "") + (success.customer?.phone ?? "")
                let customerID = success.customer?.id
                let email = success.customer?.email
                let customerDisplayName = success.customer?.displayName
                UserDefaults.standard.set(customerIDOj, forKey: "customerID")
                UserDefaults.standard.set(customerID, forKey: "shopifyCustomerID")
                UserDefaults.standard.set(email, forKey: "email")
                UserDefaults.standard.set(customerDisplayName, forKey: "displayName")
                self.isLoading = false
            case .failure(let failure):
                print(failure)
                self.iserror = true
            }
        })
    }
    func deleteAddress(id : String){
        guard let token = UserDefaults.standard.string(forKey: "accessToken") else { return }
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: MutationDeleteAddressMutation(customerAddressDeleteId: id, customerAccessToken: token) , responseModel: DataClassDeletedCustomer.self, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success( _):
                self.featchAddress()
                print("deleted \(id)")
            case .failure(let error):
                print("Failed to delete address : \(error)")
            }
        })
    }
}


