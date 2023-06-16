import Foundation

class AboutUsViewModel: ObservableObject {
    @Published var developers: [Developer] = [
        Developer(name: "Marwan Albahnasawy", photoName: "client1"),
        Developer(name: "Moamen Gomaa", photoName: "client1"),
        Developer(name: "Muhammad Fathy", photoName: "client1"),
        Developer(name: "Ahmad Hemeda", photoName: "client1")
    ]
    
    let aboutText = "We are a team of passionate developers dedicated to creating exceptional mobile apps."
}
