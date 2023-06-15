//
//  AddressPage.swift
//  final test
//
//  Created by mo_fathy on 13/06/2023.
//

import SwiftUI
import CoreLocationUI
import MapKit


struct AddressPage: View {
    @State private var validAll = false
    @State private var valid = ""
    @ObservedObject var viewModel = AddressViewModel()
    @State var selectorIndex = 0
    @State var address1: String = ""
    @State var address2: String = ""
    @State var city: String = ""
    @State var country: String = ""
    @State var phone: String = ""
    @State var zip: String =  ""
    var body: some View {
       
        
        VStack{
            Picker("", selection: $selectorIndex) {
                Text("enter").tag(0)
                Text("cuttert").tag(1)
                Text("maps").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
                .padding([.horizontal, .vertical], 10)
            Spacer()
            switch selectorIndex{
            case 1:
                LocationButton {
                    viewModel.requestLocation()
                    if viewModel.placemark == nil {
                    }else{
                    selectorIndex = viewModel.selectorIndex
                    }
                }.frame(height: 44)
                    .padding()
                Spacer()
                
            case 2:
                ZStack {
                    Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                        MapAnnotation(coordinate: location.coordinate) {
                            VStack {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(Circle())

                                Text(location.name)
                                    .fixedSize()
                            }
                            .onTapGesture {
                                viewModel.selectedPlace = location
                            }
                        }
                    }
                    .ignoresSafeArea()

                    Circle()
                        .fill(.blue)
                        .opacity(0.3)
                        .frame(width: 32, height: 32)

                    VStack {
                        Spacer()

                        HStack {
                            Spacer()

                            Button {
                                viewModel.addLocation()
                                if viewModel.placemark == nil {
                                }else{
                                    selectorIndex = 0
                                }
                            } label: {
                                Image(systemName: "plus")
                            }
                            .padding()
                            .background(.black.opacity(0.75))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                        }
                    }
                }
                
            default :
                VStack{
                    Form {
                        Section(header: Text("Address")) {
                            TextField("Address Line 1 *", text: $address1)
                            TextField("Address Line 2", text: $address2)
                            TextField("City *", text: $city)
                            TextField("Zip Code *", text: $zip)
                            TextField("Country *", text: $country)
                        }
                        Section(header: Text("Contact")) {
                            TextField("Phone Number", text: $phone)
                        }
                        
                    }
                    .navigationTitle("Address")
                    .onAppear{
                            country = viewModel.placemark?.country ?? ""
                            address1 = viewModel.placemark?.name ?? ""
                            zip = viewModel.placemark?.postalCode ?? ""
                            city = viewModel.placemark?.locality ?? ""
                        viewModel.placemark = nil
                    }
                    Button {
                       if (viewModel.validatePhoneNumber(value: phone)){
                           validAll = false
                            if(address1.isEmpty || city.isEmpty || country.isEmpty || zip.isEmpty || phone.isEmpty  ){
                                valid = "Check Inputs"
                                validAll = true
                            }else{
                               validAll = false
                                viewModel.addAddress(address1: address1, address2: address2, city: city, country: country, phone: phone, zip: zip)
                            }
                        }
                    else{
                        valid = "Number Is Not Valid"
                        validAll = true
                        
                        }
                       
                    } label: {
                        Text("add address")
                            .padding()
                            .cornerRadius(25)
                            .frame(width: 200, height: 50)
                    }
                    
                    
                }
            }
               
        }.onAppear{
            viewModel.requestLocation()
        }
        .alert(isPresented: $validAll) {
           Alert(title: Text("Important message"), message: Text(valid), dismissButton: .default(Text("Got it!")){

           })
       }
  
    }
               
    
}

struct AddressPage_Previews: PreviewProvider {
    static var previews: some View {
        AddressPage()
    }
}
