//import Foundation
//
//class ProfileViewModel: ObservableObject {
//
//    @Published var customer: CustomerDetailsResponse? {
//        didSet {
//            print("Customer details updated: \(String(describing: customer))")
//        }
//    }
//
//    func fetchCustomerDetails() {
//        guard let token = UserDefaults.standard.string(forKey: "accessToken") else { return }
//
//        let query = CustomerQuery(customerAccessToken: token)
//        NetworkManager.getInstance(requestType: .storeFront).queryGraphQLRequest(query: query, responseModel: CustomerDetailsResponse.self) { [weak self] result in
//            switch result {
//            case .success(let response):
//                self?.customer = response
//                print("Customer details response: \(response)")
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//}
