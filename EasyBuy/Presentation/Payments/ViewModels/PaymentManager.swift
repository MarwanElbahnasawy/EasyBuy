//
//  PaymentManager.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 16/06/2023.
//

import Foundation
import PassKit

class PaymentManager: NSObject , PKPaymentAuthorizationControllerDelegate{
    
    var items: [LinesItemNode]
    var totalPrice: String
    var currencyCode: String
    var draftOrderID: String
    var button = PKPaymentButton.init(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
    
    init(items: [LinesItemNode], totalPrice: String, currencyCode: String, draftOrderId: String) {
        self.items = items
        self.totalPrice = totalPrice
        self.currencyCode = currencyCode
        self.draftOrderID = draftOrderId
        super.init()
        button.addTarget(self, action: #selector(callBack), for: .touchUpInside)
    }
    @objc func callBack(sender: Any){
        startPayment(items: items, totalPrice: totalPrice, currencyCode: currencyCode)
    }
    func startPayment(items: [LinesItemNode],totalPrice: String , currencyCode: String){
        var paymentController: PKPaymentAuthorizationController?
        var paymentsummaryItems = [PKPaymentSummaryItem] ()
        items.forEach { product in
            if let price = product.variant?.price {
                let item = PKPaymentSummaryItem(label: product.product?.title ?? "not availabel", amount:NSDecimalNumber(string: "\(String(describing: price))"))
                paymentsummaryItems.append(item)
            }
        }
        let total = PKPaymentSummaryItem(label:"Total", amount:NSDecimalNumber(string: totalPrice))
        paymentsummaryItems.append(total)
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentsummaryItems
        paymentRequest.countryCode = "SA"
        paymentRequest.currencyCode = currencyCode
        paymentRequest.supportedNetworks = [.visa,.masterCard]
        paymentRequest.shippingType = .delivery
        paymentRequest.merchantIdentifier = "merchant.com.pushpendra.pay"
        paymentRequest.merchantCapabilities = .capability3DS
        paymentRequest.shippingMethods = shippingMethodCaculator()
        paymentRequest.requiredShippingContactFields=[.name,.phoneNumber]
        paymentController = PKPaymentAuthorizationController (paymentRequest: paymentRequest)
        paymentController?.delegate = self
        paymentController?.present()
    }
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        completeOrder()
        draftOrderDelete()
        controller.dismiss()
    }
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment) async -> PKPaymentAuthorizationResult {
        .init(status: .success, errors: nil)
    }
    func shippingMethodCaculator () -> [PKShippingMethod] {
        let today = Date()
        let calendar = Calendar.current
        let shippingStart = calendar.date(byAdding: .day, value: 5, to: today)
        let shippingEnd = calendar.date(byAdding: .day, value: 10, to: today)
        if let shippingEnd = shippingEnd, let shippingStart = shippingStart {
            let startComponents = calendar.dateComponents([.calendar,.year,.month, .day], from: shippingStart)
            let endComponents = calendar.dateComponents ([.calendar, .year, .month, .day], from: shippingEnd)
            let shippingDelivery = PKShippingMethod (label: "Delivery", amount: NSDecimalNumber(string: "0.00" ))
            shippingDelivery.dateComponentsRange=PKDateComponentsRange(start: startComponents, end: endComponents)
            shippingDelivery.detail = "Arrives by 5pm on July 29."
            shippingDelivery.identifier = "DELIVERY"
            return [shippingDelivery]
        }
        return []
    }
    func completeOrder(){
        print("the draft order is \(draftOrderID)")
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderCompleteMutation(id: draftOrderID), responseModel: DraftOrderCompleteDataClass.self) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    func draftOrderDelete(){
        NetworkManager.getInstance(requestType: .admin).performGraphQLRequest(mutation: DraftOrderDeleteMutation(input: DraftOrderDeleteInput(id: draftOrderID)), responseModel: DeleteDraftOrderDataClass.self) { result in
            switch result {
            case .success(let success):
                print(success)
                // delete from fire base
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
