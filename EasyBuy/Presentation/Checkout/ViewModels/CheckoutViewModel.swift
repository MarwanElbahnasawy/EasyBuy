//
//  CheckoutViewModel.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 15/06/2023.
//

import Foundation

class CheckoutViewModel: ObservableObject{
    @Published var products: [LinesItemNode]?
    @Published var totalPrice: String = "100"
    @Published var priceAfterDiscounts: String = "100"
    @Published var discountCodes: String = ""
    @Published var cartDraftOrderID: String?
    @Published var customerDiscountCodes: CustomerDiscountCodes?
    @Published var customerAddress: CustomerAddress?
    @Published var settingsViewModel = SettingsViewModel()
    init() {
      getProducts()
        customerAddress = settingsViewModel.getAddress()
    }
    func getProducts(){
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument(completion: {[weak self] snapshot, error in
            
            if let error = error {
                print("Failed to fetch current user:", error)
                return
            }
            guard let data = snapshot?.data() else {
                print("no data found")
                self?.products = []
                return
            }
            
            let objFireBase = FireBaseManager.shared.mapFireBaseObject(data: data)
            self?.customerDiscountCodes = objFireBase
            self?.cartDraftOrderID = objFireBase?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.id
            self?.getDraftOrders(id: self?.cartDraftOrderID ?? "")
        })
    }
    private func getDraftOrders(id: String){
        NetworkManager.getInstance(requestType: .admin).queryGraphQLRequest(query: DraftOrderQuery(id: id), responseModel: DraftOrderCreate.self) { [weak self] res in
            switch res {
            case .success(let success):
                self?.products = success.draftOrder?.lineItems?.nodes
                self?.totalPrice = success.draftOrder?.subtotalPrice ?? "0"
                self?.priceAfterDiscounts = success.draftOrder?.subtotalPrice ?? "0"
            case .failure(let failure):
                print(failure)
                self?.products = []
            }
        }
    }
    func applyDiscountCode(){
        let precentage = discountCodes.split(separator: "O").first
        print(precentage ?? "default")
        let precentageValue = (precentage as! NSString).doubleValue
        var  lineItems: [DraftOrderLineItemInput] = []
        lineItems = mapLineItemsToDratOrderLineItems(lineItems: customerDiscountCodes?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.lineItems?.nodes)
        print("lines items \(lineItems)")
        
        let appliedDiscountCodes = DraftOrderAppliedDiscountInput(title: discountCodes, value:precentageValue , valueType: .percentage)
        let draftOrderInput = DraftOrderInput(appliedDiscount: appliedDiscountCodes, billingAddress: nil, lineItems: lineItems)
        UpdateDraftOrder(id: cartDraftOrderID ?? "", draftOrderInput: draftOrderInput, customerDiscountCodes: customerDiscountCodes ?? CustomerDiscountCodes())
    }
    func UpdateDraftOrder(id: String,draftOrderInput: DraftOrderInput,customerDiscountCodes: CustomerDiscountCodes){
        print("id is \(id)")
        print("draftOrderInput is \(draftOrderInput)")
        print("customerDiscountCodes is \(customerDiscountCodes)")
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderUpdateMutation(id: id, input: draftOrderInput), responseModel: UpdateDraftOrderDataClass.self) {[weak self] res in
            switch res {
            case .success(let success):
                print(success)
                self?.priceAfterDiscounts = success.draftOrderUpdate?.draftOrder?.subtotalPrice ?? ""
                FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: customerDiscountCodes.id,discountCodes: customerDiscountCodes.discountCodes,draftOrders: DraftOrders(favoriteDraftorder: customerDiscountCodes.draftOrders?.favoriteDraftorder, cartDraftOrder: DraftOrderDataClass(draftOrderCreate: DraftOrderCreate(draftOrder: success.draftOrderUpdate?.draftOrder)))))
                
            case .failure(let failure):
                print(failure)
            }
        }
    }

}
