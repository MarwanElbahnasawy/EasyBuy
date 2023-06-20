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
    @ObservedObject var viewModel = AddressViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var validAll = false
    @State private var valid = ""
    @State var selectorIndex = 0
    @State var address1: String = ""
    @State var address2: String = ""
    @State var city: String = ""
    @State var country: String = ""
    @State var phone: String = ""
    @State var zip: String =  ""
    var body: some View {
        
        
        VStack{
            NavigationBarView()
            Picker("", selection: $selectorIndex) {
                Text("Custom").tag(0)
                Text("Map").tag(2)
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
                                Image(systemName: "mappin")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.blue)
                                    .frame(width: 44, height: 44)
                                
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
                                selectorIndex = 0
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
                    .onAppear{
                        viewModel.bindResultToViewController = {() in
                            print ("done" )
                            country = viewModel.placemark?.country ?? ""
                            address1 = viewModel.placemark?.name ?? ""
                            zip = viewModel.placemark?.postalCode ?? ""
                            city = viewModel.placemark?.locality ?? ""
                        }
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
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                        else{
                            valid = "Number Is Not Valid"
                            validAll = true
                        }
                    } label: {
                        Text("add address")
                            .padding()
                            .background(Color("myblack"))
                            .cornerRadius(30)
                            .foregroundColor(Color("myWhite"))
                            .frame(width: 300, height: 50,alignment: .center)
                            
                    }
                    Spacer(minLength: UIScreen.main.bounds.width * 0.15)
                }
                
            }
            
        }.background(Color("addressPageColor"))
        .onAppear{
            viewModel.manager.requestWhenInUseAuthorization()
            viewModel.bindResultToViewController = {() in
                print ("done" )
                country = viewModel.placemark?.country ?? ""
                address1 = viewModel.placemark?.name ?? ""
                zip = viewModel.placemark?.postalCode ?? ""
                city = viewModel.placemark?.locality ?? ""
            }
        }
        
        .alert(isPresented: $validAll) {
            Alert(title: Text("Important message"), message: Text(valid))
        }
        .navigationBarBackButtonHidden(true)
        
    }
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color("secColorBackground"))
            }
            .padding(.leading, 10)
            .frame(width: 50, height: 50)
            Spacer()
            
            LocationButton {
                viewModel.requestLocation()
            }.tint(.clear)
                .foregroundColor(.gray)
                .labelStyle(.iconOnly)
                .frame( height: 50)
                .padding(.trailing,15)
        }
        .frame(width: UIScreen.main.bounds.width, height: 35)
    }
    
}

struct AddressPage_Previews: PreviewProvider {
    static var previews: some View {
        AddressPage()
    }
}
