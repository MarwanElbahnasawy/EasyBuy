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
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @Published var locations: [Location] = []
    @Published var address: [CustomerAddress] = []
    @Published var iserror: Bool = false
    @Published var isLoading: Bool = true
    @Published var selectedPlace: Location?
    @Published var selectorIndex = 0
    let manager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var placemark: CLPlacemark?
    
    override init() {
        super.init()
        manager.delegate = self
        featchAddress()
    }
    func requestLocation() {
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: location!.latitude, longitude: location!.longitude)
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) -> Void in
            guard let placeMark = placemarks?.first else { return }
            self.placemark = placeMark
        }
        mapRegion = {
            let mapCoordinates = CLLocationCoordinate2D(latitude: location.coordinate.latitude , longitude: location.coordinate.longitude )
            let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            let mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
            
            return mapRegion
        }()
    }
    func addLocation() {
        let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
        locations = []
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: newLocation.latitude, longitude: newLocation.longitude)
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) -> Void in
            guard let placeMark = placemarks?.first else { return }
            self.placemark = placeMark
            
        }
        locations.append(newLocation)
       
    }
    
    func validatePhoneNumber(value: String) -> Bool {
        let PHONE_REGEX = "^01[0125][0-9]{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    func addAddress(address1: String,address2: String,city: String,country: String,phone: String,zip: String ){
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation:  CustomerAddressCreateMutation(customerAccessToken: "87169899dfeebbd0b776e9d6c8d4aaf9", address: MailingAddressInput(address1: address1, address2: address2, city: city, country: country , phone: phone, zip: zip)), responseModel: ResAddress.self, completion: { result in
            switch result {
            case .success(let response):
                
                print(" create access token: \(response.customerAddressCreate?.customerAddress?.address1 ?? "")")
            case .failure(let error):
                print("Failed to create access token: \(error)")
            }
        })
    }
    func featchAddress(){
        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query:QueryGetAddressQuery(customerAccessToken: "87169899dfeebbd0b776e9d6c8d4aaf9",first: 20) , responseModel: DataClassAddress.self, completion: { result in
                            switch result {
                            case .success(let success):
                                self.address = success.customer?.addresses?.nodes ?? []
                                self.isLoading = false
                            case .failure(let failure):
                                print(failure)
                                self.iserror = true
                            }
                        })
    }
    func deleteAddress(id : String){
        NetworkManager.getInstance(requestType: .storeFront).performGraphQLRequest(mutation: MutationDeleteAddressMutation(customerAddressDeleteId: id, customerAccessToken: "87169899dfeebbd0b776e9d6c8d4aaf9") , responseModel: DataClassDeletedCustomer.self, completion: { result in
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


