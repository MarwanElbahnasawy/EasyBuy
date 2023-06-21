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
    @Published var taxFees = ""
    @Published var isLoading = true
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
                if let totalPrice = success.draftOrder?.totalPrice{
                    let totalPriceDoubleValue = (totalPrice as NSString).doubleValue
                    if let subtotal = success.draftOrder?.subtotalPrice{
                        let subtotalPrice = (subtotal as NSString).doubleValue
                        let taxFees = totalPriceDoubleValue - subtotalPrice
                        self?.taxFees = taxFees.description
                    }
                }
                self?.isLoading = false
            case .failure(let failure):
                print(failure)
                self?.products = []
                self?.isLoading = false
            }
        }
    }
    func applyDiscountCode(){
        let precentage = discountCodes.split(separator: "O").first
        print(precentage ?? "default")
        if let percentage = precentage{
            let precentageValue = (percentage as NSString).doubleValue
            var  lineItems: [DraftOrderLineItemInput] = []
            lineItems = mapLineItemsToDratOrderLineItems(lineItems: customerDiscountCodes?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.lineItems?.nodes)
            print("lines items \(lineItems)")
            let billingAdress = MailingAddressInput(address1: customerAddress?.address1, address2: customerAddress?.address2, city: customerAddress?.city, country: customerAddress?.country, phone: customerAddress?.phone, zip: customerAddress?.zip )
            let appliedDiscountCodes = DraftOrderAppliedDiscountInput(title: discountCodes, value:precentageValue , valueType: .percentage)
            let draftOrderInput = DraftOrderInput(appliedDiscount: appliedDiscountCodes, billingAddress: billingAdress, lineItems: lineItems)
            UpdateDraftOrder(id: cartDraftOrderID ?? "", draftOrderInput: draftOrderInput, customerDiscountCodes: customerDiscountCodes ?? CustomerDiscountCodes(),isApplyDiscountCode: true)
        }
        
    }
    func UpdateDraftOrder(id: String,draftOrderInput: DraftOrderInput,customerDiscountCodes: CustomerDiscountCodes,isApplyDiscountCode: Bool){
        print("id is \(id)")
        print("draftOrderInput is \(draftOrderInput)")
        print("customerDiscountCodes is \(customerDiscountCodes)")
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderUpdateMutation(id: id, input: draftOrderInput), responseModel: UpdateDraftOrderDataClass.self) {[weak self] res in
            switch res {
            case .success(let success):
                print(success)
                if isApplyDiscountCode{
                    self?.applyDiscountCodeForUser()
                    FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: CustomerDiscountCodes(id: customerDiscountCodes.id,discountCodes: customerDiscountCodes.discountCodes, usedDiscountCodes: customerDiscountCodes.usedDiscountCodes,draftOrders: DraftOrders(favoriteDraftorder: customerDiscountCodes.draftOrders?.favoriteDraftorder, cartDraftOrder: DraftOrderDataClass(draftOrderCreate: DraftOrderCreate(draftOrder: success.draftOrderUpdate?.draftOrder)))))
                }
                self?.priceAfterDiscounts = success.draftOrderUpdate?.draftOrder?.subtotalPrice ?? "0"
//                if let totalPrice = self?.totalPrice{
//                    let totalPriceDoubleValue = (totalPrice as NSString).doubleValue
//                    if let subtotal = success.draftOrderUpdate?.draftOrder?.subtotalPrice{
//                        let subtotalPrice = (subtotal as NSString).doubleValue
//                        let taxFees = totalPriceDoubleValue - subtotalPrice
//                        self?.taxFees = taxFees.description
//                    }
//                }

            case .failure(let failure):
                print(failure)
            }
        }
    }
    func updateAdrees(){
        var  lineItems: [DraftOrderLineItemInput] = []
        lineItems = mapLineItemsToDratOrderLineItems(lineItems: customerDiscountCodes?.draftOrders?.cartDraftOrder?.draftOrderCreate?.draftOrder?.lineItems?.nodes)
        let billingAdress = MailingAddressInput(address1: customerAddress?.address1, address2: customerAddress?.address2, city: customerAddress?.city, country: customerAddress?.country, phone: customerAddress?.phone, zip: customerAddress?.zip )
        print(billingAdress)
        let draftOrderInput = DraftOrderInput( billingAddress: billingAdress, lineItems: lineItems)

        UpdateDraftOrder(id: cartDraftOrderID ?? "", draftOrderInput: draftOrderInput, customerDiscountCodes: customerDiscountCodes ?? CustomerDiscountCodes(), isApplyDiscountCode: false)

    }
    
    func applyDiscountCodeForUser(){
        
        FireBaseManager.shared.retriveCustomerDiscountCodes()?.getDocument(completion:
        {[weak self] snapshot, error in
            
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
            var usedDiscountCodes = objFireBase?.usedDiscountCodes ?? []
            usedDiscountCodes.append(self?.discountCodes ?? "")
            let UnusedDiscountCodes = objFireBase?.discountCodes?.filter({$0 != self?.discountCodes})
            var filterUnused: [String] = []
            for code in usedDiscountCodes{
                filterUnused = UnusedDiscountCodes?.filter({$0 != code}) ?? []
            }
            let favDraftOrder = self?.customerDiscountCodes?.draftOrders?.favoriteDraftorder
            let cartDraftORder = self?.customerDiscountCodes?.draftOrders?.cartDraftOrder
            let customerDiscountCodesFireBase =
            CustomerDiscountCodes(id: self?.customerDiscountCodes?.id,
                                  discountCodes: filterUnused,
                                  usedDiscountCodes: usedDiscountCodes,
                                  draftOrders: DraftOrders(favoriteDraftorder: favDraftOrder,
                                                           cartDraftOrder: cartDraftORder))
            FireBaseManager.shared.saveCustomerDiscountCodes(customerDiscountCodes: customerDiscountCodesFireBase)
            
        })
        
        
    }
    
}
