import Foundation

class AboutUsViewModel: ObservableObject {
    @Published var developers: [Developer] = [
        Developer(name: "Marwan Albahnasawy", photoName: "marwan"),
        Developer(name: "Moamen Gomaa", photoName: "moamen"),
        Developer(name: "Muhammad Fathy", photoName: "fathy"),
        Developer(name: "Ahmad Hemeda", photoName: "hemeda")
    ]
    
    let aboutText = "We are a team of passionate developers dedicated to creating exceptional mobile apps."
    let contactInfo = "Contact Us\nEmail: easybuy@gmail.com"
    let services = "Our Services\n- Mobile App Development"
}

