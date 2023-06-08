// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// The status of the discount.
public enum DiscountStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// The discount is active.
  case active
  /// The discount is expired.
  case expired
  /// The discount is scheduled.
  case scheduled
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ACTIVE": self = .active
      case "EXPIRED": self = .expired
      case "SCHEDULED": self = .scheduled
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .active: return "ACTIVE"
      case .expired: return "EXPIRED"
      case .scheduled: return "SCHEDULED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DiscountStatus, rhs: DiscountStatus) -> Bool {
    switch (lhs, rhs) {
      case (.active, .active): return true
      case (.expired, .expired): return true
      case (.scheduled, .scheduled): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DiscountStatus] {
    return [
      .active,
      .expired,
      .scheduled,
    ]
  }
}

/// The input fields to create or update a basic code discount.
public struct DiscountCodeBasicInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - combinesWith: Determines which discount classes the discount can combine with.
  ///   - title: The title of the discount.
  ///   - startsAt: The date and time when the discount starts.
  ///   - endsAt: The date and time when the discount ends. For open-ended discounts, use `null`.
  ///   - usageLimit: The maximum number of times that the discount can be used. For open-ended discounts, use `null`.
  ///   - appliesOncePerCustomer: Whether the discount can be applied only once per customer.
  ///   - minimumRequirement: The minimum subtotal or quantity that's required for the discount to be applied.
  ///   - customerGets: The qualifying items in an order, the quantity of each one, and the total value of the discount.
  ///   - customerSelection: The customers that can use the discount.
  ///   - code: The code to use the discount.
  ///   - recurringCycleLimit: The number of times a discount applies on recurring purchases (subscriptions).
  public init(combinesWith: Swift.Optional<DiscountCombinesWithInput?> = nil, title: Swift.Optional<String?> = nil, startsAt: Swift.Optional<String?> = nil, endsAt: Swift.Optional<String?> = nil, usageLimit: Swift.Optional<Int?> = nil, appliesOncePerCustomer: Swift.Optional<Bool?> = nil, minimumRequirement: Swift.Optional<DiscountMinimumRequirementInput?> = nil, customerGets: Swift.Optional<DiscountCustomerGetsInput?> = nil, customerSelection: Swift.Optional<DiscountCustomerSelectionInput?> = nil, code: Swift.Optional<String?> = nil, recurringCycleLimit: Swift.Optional<Int?> = nil) {
    graphQLMap = ["combinesWith": combinesWith, "title": title, "startsAt": startsAt, "endsAt": endsAt, "usageLimit": usageLimit, "appliesOncePerCustomer": appliesOncePerCustomer, "minimumRequirement": minimumRequirement, "customerGets": customerGets, "customerSelection": customerSelection, "code": code, "recurringCycleLimit": recurringCycleLimit]
  }

  /// Determines which discount classes the discount can combine with.
  public var combinesWith: Swift.Optional<DiscountCombinesWithInput?> {
    get {
      return graphQLMap["combinesWith"] as? Swift.Optional<DiscountCombinesWithInput?> ?? Swift.Optional<DiscountCombinesWithInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "combinesWith")
    }
  }

  /// The title of the discount.
  public var title: Swift.Optional<String?> {
    get {
      return graphQLMap["title"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  /// The date and time when the discount starts.
  public var startsAt: Swift.Optional<String?> {
    get {
      return graphQLMap["startsAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startsAt")
    }
  }

  /// The date and time when the discount ends. For open-ended discounts, use `null`.
  public var endsAt: Swift.Optional<String?> {
    get {
      return graphQLMap["endsAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endsAt")
    }
  }

  /// The maximum number of times that the discount can be used. For open-ended discounts, use `null`.
  public var usageLimit: Swift.Optional<Int?> {
    get {
      return graphQLMap["usageLimit"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "usageLimit")
    }
  }

  /// Whether the discount can be applied only once per customer.
  public var appliesOncePerCustomer: Swift.Optional<Bool?> {
    get {
      return graphQLMap["appliesOncePerCustomer"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "appliesOncePerCustomer")
    }
  }

  /// The minimum subtotal or quantity that's required for the discount to be applied.
  public var minimumRequirement: Swift.Optional<DiscountMinimumRequirementInput?> {
    get {
      return graphQLMap["minimumRequirement"] as? Swift.Optional<DiscountMinimumRequirementInput?> ?? Swift.Optional<DiscountMinimumRequirementInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "minimumRequirement")
    }
  }

  /// The qualifying items in an order, the quantity of each one, and the total value of the discount.
  public var customerGets: Swift.Optional<DiscountCustomerGetsInput?> {
    get {
      return graphQLMap["customerGets"] as? Swift.Optional<DiscountCustomerGetsInput?> ?? Swift.Optional<DiscountCustomerGetsInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "customerGets")
    }
  }

  /// The customers that can use the discount.
  public var customerSelection: Swift.Optional<DiscountCustomerSelectionInput?> {
    get {
      return graphQLMap["customerSelection"] as? Swift.Optional<DiscountCustomerSelectionInput?> ?? Swift.Optional<DiscountCustomerSelectionInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "customerSelection")
    }
  }

  /// The code to use the discount.
  public var code: Swift.Optional<String?> {
    get {
      return graphQLMap["code"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "code")
    }
  }

  /// The number of times a discount applies on recurring purchases (subscriptions).
  public var recurringCycleLimit: Swift.Optional<Int?> {
    get {
      return graphQLMap["recurringCycleLimit"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recurringCycleLimit")
    }
  }
}

/// The input fields to determine which discount classes the discount can combine with.
public struct DiscountCombinesWithInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - productDiscounts: Combines with product discounts.
  ///   - orderDiscounts: Combines with order discounts.
  ///   - shippingDiscounts: Combines with shipping discounts.
  public init(productDiscounts: Swift.Optional<Bool?> = nil, orderDiscounts: Swift.Optional<Bool?> = nil, shippingDiscounts: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["productDiscounts": productDiscounts, "orderDiscounts": orderDiscounts, "shippingDiscounts": shippingDiscounts]
  }

  /// Combines with product discounts.
  public var productDiscounts: Swift.Optional<Bool?> {
    get {
      return graphQLMap["productDiscounts"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "productDiscounts")
    }
  }

  /// Combines with order discounts.
  public var orderDiscounts: Swift.Optional<Bool?> {
    get {
      return graphQLMap["orderDiscounts"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "orderDiscounts")
    }
  }

  /// Combines with shipping discounts.
  public var shippingDiscounts: Swift.Optional<Bool?> {
    get {
      return graphQLMap["shippingDiscounts"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "shippingDiscounts")
    }
  }
}

/// The input fields for the minimum quantity or subtotal required for a discount.
public struct DiscountMinimumRequirementInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - quantity: The minimum required quantity.
  ///   - subtotal: The minimum required subtotal.
  public init(quantity: Swift.Optional<DiscountMinimumQuantityInput?> = nil, subtotal: Swift.Optional<DiscountMinimumSubtotalInput?> = nil) {
    graphQLMap = ["quantity": quantity, "subtotal": subtotal]
  }

  /// The minimum required quantity.
  public var quantity: Swift.Optional<DiscountMinimumQuantityInput?> {
    get {
      return graphQLMap["quantity"] as? Swift.Optional<DiscountMinimumQuantityInput?> ?? Swift.Optional<DiscountMinimumQuantityInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "quantity")
    }
  }

  /// The minimum required subtotal.
  public var subtotal: Swift.Optional<DiscountMinimumSubtotalInput?> {
    get {
      return graphQLMap["subtotal"] as? Swift.Optional<DiscountMinimumSubtotalInput?> ?? Swift.Optional<DiscountMinimumSubtotalInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subtotal")
    }
  }
}

/// The input fields for the minimum quantity required for the discount.
public struct DiscountMinimumQuantityInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - greaterThanOrEqualToQuantity: The minimum quantity of items that's required for the discount to be applied.
  public init(greaterThanOrEqualToQuantity: Swift.Optional<String?> = nil) {
    graphQLMap = ["greaterThanOrEqualToQuantity": greaterThanOrEqualToQuantity]
  }

  /// The minimum quantity of items that's required for the discount to be applied.
  public var greaterThanOrEqualToQuantity: Swift.Optional<String?> {
    get {
      return graphQLMap["greaterThanOrEqualToQuantity"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "greaterThanOrEqualToQuantity")
    }
  }
}

/// The input fields for the minimum subtotal required for a discount.
public struct DiscountMinimumSubtotalInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - greaterThanOrEqualToSubtotal: The minimum subtotal that's required for the discount to be applied.
  public init(greaterThanOrEqualToSubtotal: Swift.Optional<String?> = nil) {
    graphQLMap = ["greaterThanOrEqualToSubtotal": greaterThanOrEqualToSubtotal]
  }

  /// The minimum subtotal that's required for the discount to be applied.
  public var greaterThanOrEqualToSubtotal: Swift.Optional<String?> {
    get {
      return graphQLMap["greaterThanOrEqualToSubtotal"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "greaterThanOrEqualToSubtotal")
    }
  }
}

/// Specifies the items that will be discounted, the quantity of items that will be discounted, and the value of discount.
public struct DiscountCustomerGetsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - value: The quantity of items discounted and the discount value.
  ///   - items: The IDs of the items that the customer gets. The items can be either collections or products.
  ///   - appliesOnOneTimePurchase: Whether the discount applies on regular one-time-purchase items.
  ///   - appliesOnSubscription: Whether the discount applies on subscription items.
  public init(value: Swift.Optional<DiscountCustomerGetsValueInput?> = nil, items: Swift.Optional<DiscountItemsInput?> = nil, appliesOnOneTimePurchase: Swift.Optional<Bool?> = nil, appliesOnSubscription: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["value": value, "items": items, "appliesOnOneTimePurchase": appliesOnOneTimePurchase, "appliesOnSubscription": appliesOnSubscription]
  }

  /// The quantity of items discounted and the discount value.
  public var value: Swift.Optional<DiscountCustomerGetsValueInput?> {
    get {
      return graphQLMap["value"] as? Swift.Optional<DiscountCustomerGetsValueInput?> ?? Swift.Optional<DiscountCustomerGetsValueInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }

  /// The IDs of the items that the customer gets. The items can be either collections or products.
  public var items: Swift.Optional<DiscountItemsInput?> {
    get {
      return graphQLMap["items"] as? Swift.Optional<DiscountItemsInput?> ?? Swift.Optional<DiscountItemsInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "items")
    }
  }

  /// Whether the discount applies on regular one-time-purchase items.
  public var appliesOnOneTimePurchase: Swift.Optional<Bool?> {
    get {
      return graphQLMap["appliesOnOneTimePurchase"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "appliesOnOneTimePurchase")
    }
  }

  /// Whether the discount applies on subscription items.
  public var appliesOnSubscription: Swift.Optional<Bool?> {
    get {
      return graphQLMap["appliesOnSubscription"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "appliesOnSubscription")
    }
  }
}

/// The input fields for the quantity of items discounted and the discount value.
public struct DiscountCustomerGetsValueInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - discountOnQuantity: The quantity of the items that are discounted and the discount value.
  ///   - percentage: The percentage value of the discount. Value must be between 0.00 - 1.00.
  ///   - discountAmount: The value of the discount.
  public init(discountOnQuantity: Swift.Optional<DiscountOnQuantityInput?> = nil, percentage: Swift.Optional<Double?> = nil, discountAmount: Swift.Optional<DiscountAmountInput?> = nil) {
    graphQLMap = ["discountOnQuantity": discountOnQuantity, "percentage": percentage, "discountAmount": discountAmount]
  }

  /// The quantity of the items that are discounted and the discount value.
  public var discountOnQuantity: Swift.Optional<DiscountOnQuantityInput?> {
    get {
      return graphQLMap["discountOnQuantity"] as? Swift.Optional<DiscountOnQuantityInput?> ?? Swift.Optional<DiscountOnQuantityInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "discountOnQuantity")
    }
  }

  /// The percentage value of the discount. Value must be between 0.00 - 1.00.
  public var percentage: Swift.Optional<Double?> {
    get {
      return graphQLMap["percentage"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "percentage")
    }
  }

  /// The value of the discount.
  public var discountAmount: Swift.Optional<DiscountAmountInput?> {
    get {
      return graphQLMap["discountAmount"] as? Swift.Optional<DiscountAmountInput?> ?? Swift.Optional<DiscountAmountInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "discountAmount")
    }
  }
}

/// The input fields for the quantity of items discounted and the discount value.
public struct DiscountOnQuantityInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - quantity: The quantity of items that are discounted.
  ///   - effect: The percentage value of the discount.
  public init(quantity: Swift.Optional<String?> = nil, effect: Swift.Optional<DiscountEffectInput?> = nil) {
    graphQLMap = ["quantity": quantity, "effect": effect]
  }

  /// The quantity of items that are discounted.
  public var quantity: Swift.Optional<String?> {
    get {
      return graphQLMap["quantity"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "quantity")
    }
  }

  /// The percentage value of the discount.
  public var effect: Swift.Optional<DiscountEffectInput?> {
    get {
      return graphQLMap["effect"] as? Swift.Optional<DiscountEffectInput?> ?? Swift.Optional<DiscountEffectInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "effect")
    }
  }
}

/// The input fields for how the discount will be applied. Currently, only percentage off is supported.
public struct DiscountEffectInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - percentage: The percentage value of the discount. Value must be between 0.00 - 1.00.
  public init(percentage: Swift.Optional<Double?> = nil) {
    graphQLMap = ["percentage": percentage]
  }

  /// The percentage value of the discount. Value must be between 0.00 - 1.00.
  public var percentage: Swift.Optional<Double?> {
    get {
      return graphQLMap["percentage"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "percentage")
    }
  }
}

/// The input fields for the value of the discount and how it is applied.
public struct DiscountAmountInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - amount: The value of the discount.
  ///   - appliesOnEachItem: If true, then the discount is applied to each of the entitled items. If false, then the amount is split across all of the entitled items.
  public init(amount: Swift.Optional<String?> = nil, appliesOnEachItem: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["amount": amount, "appliesOnEachItem": appliesOnEachItem]
  }

  /// The value of the discount.
  public var amount: Swift.Optional<String?> {
    get {
      return graphQLMap["amount"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  /// If true, then the discount is applied to each of the entitled items. If false, then the amount is split across all of the entitled items.
  public var appliesOnEachItem: Swift.Optional<Bool?> {
    get {
      return graphQLMap["appliesOnEachItem"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "appliesOnEachItem")
    }
  }
}

/// The input fields for the items attached to a discount. You can specify the discount items by product ID or collection ID.
public struct DiscountItemsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - products: The products and product variants that are attached to a discount.
  ///   - collections: The collections that are attached to a discount.
  ///   - all: Whether all items should be selected.
  public init(products: Swift.Optional<DiscountProductsInput?> = nil, collections: Swift.Optional<DiscountCollectionsInput?> = nil, all: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["products": products, "collections": collections, "all": all]
  }

  /// The products and product variants that are attached to a discount.
  public var products: Swift.Optional<DiscountProductsInput?> {
    get {
      return graphQLMap["products"] as? Swift.Optional<DiscountProductsInput?> ?? Swift.Optional<DiscountProductsInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "products")
    }
  }

  /// The collections that are attached to a discount.
  public var collections: Swift.Optional<DiscountCollectionsInput?> {
    get {
      return graphQLMap["collections"] as? Swift.Optional<DiscountCollectionsInput?> ?? Swift.Optional<DiscountCollectionsInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "collections")
    }
  }

  /// Whether all items should be selected.
  public var all: Swift.Optional<Bool?> {
    get {
      return graphQLMap["all"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "all")
    }
  }
}

/// The input fields for the products and product variants attached to a discount.
public struct DiscountProductsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - productsToAdd: Specifies list of product ids to add.
  ///   - productsToRemove: Specifies list of product ids to remove.
  ///   - productVariantsToAdd: Specifies list of product variant ids to add.
  ///   - productVariantsToRemove: Specifies list of product variant ids to remove.
  public init(productsToAdd: Swift.Optional<[GraphQLID]?> = nil, productsToRemove: Swift.Optional<[GraphQLID]?> = nil, productVariantsToAdd: Swift.Optional<[GraphQLID]?> = nil, productVariantsToRemove: Swift.Optional<[GraphQLID]?> = nil) {
    graphQLMap = ["productsToAdd": productsToAdd, "productsToRemove": productsToRemove, "productVariantsToAdd": productVariantsToAdd, "productVariantsToRemove": productVariantsToRemove]
  }

  /// Specifies list of product ids to add.
  public var productsToAdd: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["productsToAdd"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "productsToAdd")
    }
  }

  /// Specifies list of product ids to remove.
  public var productsToRemove: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["productsToRemove"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "productsToRemove")
    }
  }

  /// Specifies list of product variant ids to add.
  public var productVariantsToAdd: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["productVariantsToAdd"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "productVariantsToAdd")
    }
  }

  /// Specifies list of product variant ids to remove.
  public var productVariantsToRemove: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["productVariantsToRemove"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "productVariantsToRemove")
    }
  }
}

/// The input fields for collections attached to a discount.
public struct DiscountCollectionsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - add: Specifies list of collection ids to add.
  ///   - remove: Specifies list of collection ids to remove.
  public init(add: Swift.Optional<[GraphQLID]?> = nil, remove: Swift.Optional<[GraphQLID]?> = nil) {
    graphQLMap = ["add": add, "remove": remove]
  }

  /// Specifies list of collection ids to add.
  public var add: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["add"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "add")
    }
  }

  /// Specifies list of collection ids to remove.
  public var remove: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["remove"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "remove")
    }
  }
}

/// The input fields for the customers who can use this discount.
public struct DiscountCustomerSelectionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - all: Whether all customers can use this discount.
  ///   - customers: The list of customer IDs to add or remove from the list of customers.
  ///   - customerSegments: The list of customer segment IDs to add or remove from the list of customer segments.
  public init(all: Swift.Optional<Bool?> = nil, customers: Swift.Optional<DiscountCustomersInput?> = nil, customerSegments: Swift.Optional<DiscountCustomerSegmentsInput?> = nil) {
    graphQLMap = ["all": all, "customers": customers, "customerSegments": customerSegments]
  }

  /// Whether all customers can use this discount.
  public var all: Swift.Optional<Bool?> {
    get {
      return graphQLMap["all"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "all")
    }
  }

  /// The list of customer IDs to add or remove from the list of customers.
  public var customers: Swift.Optional<DiscountCustomersInput?> {
    get {
      return graphQLMap["customers"] as? Swift.Optional<DiscountCustomersInput?> ?? Swift.Optional<DiscountCustomersInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "customers")
    }
  }

  /// The list of customer segment IDs to add or remove from the list of customer segments.
  public var customerSegments: Swift.Optional<DiscountCustomerSegmentsInput?> {
    get {
      return graphQLMap["customerSegments"] as? Swift.Optional<DiscountCustomerSegmentsInput?> ?? Swift.Optional<DiscountCustomerSegmentsInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "customerSegments")
    }
  }
}

/// The input fields for which customers to add to or remove from the discount.
public struct DiscountCustomersInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - add: A list of customers to add to the current list of customers who can use the discount.
  ///   - remove: A list of customers to remove from the current list of customers who can use the discount.
  public init(add: Swift.Optional<[GraphQLID]?> = nil, remove: Swift.Optional<[GraphQLID]?> = nil) {
    graphQLMap = ["add": add, "remove": remove]
  }

  /// A list of customers to add to the current list of customers who can use the discount.
  public var add: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["add"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "add")
    }
  }

  /// A list of customers to remove from the current list of customers who can use the discount.
  public var remove: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["remove"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "remove")
    }
  }
}

/// The input fields for which customer segments to add to or remove from the discount.
public struct DiscountCustomerSegmentsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - add: A list of customer segments to add to the current list of customer segments.
  ///   - remove: A list of customer segments to remove from the current list of customer segments.
  public init(add: Swift.Optional<[GraphQLID]?> = nil, remove: Swift.Optional<[GraphQLID]?> = nil) {
    graphQLMap = ["add": add, "remove": remove]
  }

  /// A list of customer segments to add to the current list of customer segments.
  public var add: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["add"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "add")
    }
  }

  /// A list of customer segments to remove from the current list of customer segments.
  public var remove: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["remove"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "remove")
    }
  }
}

/// The input fields used to create or update a draft order.
public struct DraftOrderInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - appliedDiscount: The discount that will be applied to the draft order.
  /// A draft order line item can have one discount. A draft order can also have one order-level discount.
  ///   - billingAddress: The mailing address associated with the payment method.
  ///   - customAttributes: Extra information added to the customer.
  ///   - email: The customer's email address.
  ///   - lineItems: Product variant line item or custom line item associated to the draft order.
  /// Each draft order must include at least one line item.
  ///   - metafields: Metafields attached to the draft order.
  ///   - localizationExtensions: The localization extensions attached to the draft order. For example, Tax IDs.
  ///   - note: The text of an optional note that a shop owner can attach to the draft order.
  ///   - shippingAddress: The mailing address to where the order will be shipped.
  ///   - shippingLine: A shipping line object, which details the shipping method used.
  ///   - tags: A comma separated list of tags that have been added to the draft order.
  ///   - taxExempt: Whether or not taxes are exempt for the draft order.
  /// If false, then Shopify will refer to the taxable field for each line item.
  /// If a customer is applied to the draft order, then Shopify will use the customer's tax exempt field instead.
  ///   - useCustomerDefaultAddress: Sent as part of a draft order object to load customer shipping information.
  ///   - visibleToCustomer: Whether the draft order will be visible to the customer on the self-serve portal.
  ///   - reserveInventoryUntil: Time after which inventory will automatically be restocked.
  ///   - presentmentCurrencyCode: The payment currency of the customer for this draft order.
  ///   - marketRegionCountryCode: The selected market region country code for the draft order.
  ///   - phone: The customer's phone number.
  ///   - paymentTerms: The fields used to create payment terms.
  ///   - purchasingEntity: The purchasing entity for this draft order.
  ///   - sourceName: The source of the checkout.
  ///           To use this field for sales attribution, you must register the channels that your app is managing.
  ///           You can register the channels that your app is managing by completing
  ///           [this Google Form](https://docs.google.com/forms/d/e/1FAIpQLScmVTZRQNjOJ7RD738mL1lGeFjqKVe_FM2tO9xsm21QEo5Ozg/viewform?usp=sf_link).
  ///           After you've submitted your request, you need to wait for your request to be processed by Shopify.
  ///           You can find a list of your channels in the Partner Dashboard, in your app's Marketplace extension.
  ///           You need to specify the handle as the `source_name` value in your request.
  ///           The handle is the channel that the order was placed from.
  public init(appliedDiscount: Swift.Optional<DraftOrderAppliedDiscountInput?> = nil, billingAddress: Swift.Optional<MailingAddressInput?> = nil, customAttributes: Swift.Optional<[AttributeInput]?> = nil, email: Swift.Optional<String?> = nil, lineItems: Swift.Optional<[DraftOrderLineItemInput]?> = nil, metafields: Swift.Optional<[MetafieldInput]?> = nil, localizationExtensions: Swift.Optional<[LocalizationExtensionInput]?> = nil, note: Swift.Optional<String?> = nil, shippingAddress: Swift.Optional<MailingAddressInput?> = nil, shippingLine: Swift.Optional<ShippingLineInput?> = nil, tags: Swift.Optional<[String]?> = nil, taxExempt: Swift.Optional<Bool?> = nil, useCustomerDefaultAddress: Swift.Optional<Bool?> = nil, visibleToCustomer: Swift.Optional<Bool?> = nil, reserveInventoryUntil: Swift.Optional<String?> = nil, presentmentCurrencyCode: Swift.Optional<CurrencyCode?> = nil, marketRegionCountryCode: Swift.Optional<CountryCode?> = nil, phone: Swift.Optional<String?> = nil, paymentTerms: Swift.Optional<PaymentTermsInput?> = nil, purchasingEntity: Swift.Optional<PurchasingEntityInput?> = nil, sourceName: Swift.Optional<String?> = nil) {
    graphQLMap = ["appliedDiscount": appliedDiscount, "billingAddress": billingAddress, "customAttributes": customAttributes, "email": email, "lineItems": lineItems, "metafields": metafields, "localizationExtensions": localizationExtensions, "note": note, "shippingAddress": shippingAddress, "shippingLine": shippingLine, "tags": tags, "taxExempt": taxExempt, "useCustomerDefaultAddress": useCustomerDefaultAddress, "visibleToCustomer": visibleToCustomer, "reserveInventoryUntil": reserveInventoryUntil, "presentmentCurrencyCode": presentmentCurrencyCode, "marketRegionCountryCode": marketRegionCountryCode, "phone": phone, "paymentTerms": paymentTerms, "purchasingEntity": purchasingEntity, "sourceName": sourceName]
  }

  /// The discount that will be applied to the draft order.
  /// A draft order line item can have one discount. A draft order can also have one order-level discount.
  public var appliedDiscount: Swift.Optional<DraftOrderAppliedDiscountInput?> {
    get {
      return graphQLMap["appliedDiscount"] as? Swift.Optional<DraftOrderAppliedDiscountInput?> ?? Swift.Optional<DraftOrderAppliedDiscountInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "appliedDiscount")
    }
  }

  /// The mailing address associated with the payment method.
  public var billingAddress: Swift.Optional<MailingAddressInput?> {
    get {
      return graphQLMap["billingAddress"] as? Swift.Optional<MailingAddressInput?> ?? Swift.Optional<MailingAddressInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "billingAddress")
    }
  }

  /// Extra information added to the customer.
  public var customAttributes: Swift.Optional<[AttributeInput]?> {
    get {
      return graphQLMap["customAttributes"] as? Swift.Optional<[AttributeInput]?> ?? Swift.Optional<[AttributeInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "customAttributes")
    }
  }

  /// The customer's email address.
  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  /// Product variant line item or custom line item associated to the draft order.
  /// Each draft order must include at least one line item.
  public var lineItems: Swift.Optional<[DraftOrderLineItemInput]?> {
    get {
      return graphQLMap["lineItems"] as? Swift.Optional<[DraftOrderLineItemInput]?> ?? Swift.Optional<[DraftOrderLineItemInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lineItems")
    }
  }

  /// Metafields attached to the draft order.
  public var metafields: Swift.Optional<[MetafieldInput]?> {
    get {
      return graphQLMap["metafields"] as? Swift.Optional<[MetafieldInput]?> ?? Swift.Optional<[MetafieldInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "metafields")
    }
  }

  /// The localization extensions attached to the draft order. For example, Tax IDs.
  public var localizationExtensions: Swift.Optional<[LocalizationExtensionInput]?> {
    get {
      return graphQLMap["localizationExtensions"] as? Swift.Optional<[LocalizationExtensionInput]?> ?? Swift.Optional<[LocalizationExtensionInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "localizationExtensions")
    }
  }

  /// The text of an optional note that a shop owner can attach to the draft order.
  public var note: Swift.Optional<String?> {
    get {
      return graphQLMap["note"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "note")
    }
  }

  /// The mailing address to where the order will be shipped.
  public var shippingAddress: Swift.Optional<MailingAddressInput?> {
    get {
      return graphQLMap["shippingAddress"] as? Swift.Optional<MailingAddressInput?> ?? Swift.Optional<MailingAddressInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "shippingAddress")
    }
  }

  /// A shipping line object, which details the shipping method used.
  public var shippingLine: Swift.Optional<ShippingLineInput?> {
    get {
      return graphQLMap["shippingLine"] as? Swift.Optional<ShippingLineInput?> ?? Swift.Optional<ShippingLineInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "shippingLine")
    }
  }

  /// A comma separated list of tags that have been added to the draft order.
  public var tags: Swift.Optional<[String]?> {
    get {
      return graphQLMap["tags"] as? Swift.Optional<[String]?> ?? Swift.Optional<[String]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tags")
    }
  }

  /// Whether or not taxes are exempt for the draft order.
  /// If false, then Shopify will refer to the taxable field for each line item.
  /// If a customer is applied to the draft order, then Shopify will use the customer's tax exempt field instead.
  public var taxExempt: Swift.Optional<Bool?> {
    get {
      return graphQLMap["taxExempt"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "taxExempt")
    }
  }

  /// Sent as part of a draft order object to load customer shipping information.
  public var useCustomerDefaultAddress: Swift.Optional<Bool?> {
    get {
      return graphQLMap["useCustomerDefaultAddress"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "useCustomerDefaultAddress")
    }
  }

  /// Whether the draft order will be visible to the customer on the self-serve portal.
  public var visibleToCustomer: Swift.Optional<Bool?> {
    get {
      return graphQLMap["visibleToCustomer"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "visibleToCustomer")
    }
  }

  /// Time after which inventory will automatically be restocked.
  public var reserveInventoryUntil: Swift.Optional<String?> {
    get {
      return graphQLMap["reserveInventoryUntil"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "reserveInventoryUntil")
    }
  }

  /// The payment currency of the customer for this draft order.
  public var presentmentCurrencyCode: Swift.Optional<CurrencyCode?> {
    get {
      return graphQLMap["presentmentCurrencyCode"] as? Swift.Optional<CurrencyCode?> ?? Swift.Optional<CurrencyCode?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "presentmentCurrencyCode")
    }
  }

  /// The selected market region country code for the draft order.
  public var marketRegionCountryCode: Swift.Optional<CountryCode?> {
    get {
      return graphQLMap["marketRegionCountryCode"] as? Swift.Optional<CountryCode?> ?? Swift.Optional<CountryCode?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "marketRegionCountryCode")
    }
  }

  /// The customer's phone number.
  public var phone: Swift.Optional<String?> {
    get {
      return graphQLMap["phone"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phone")
    }
  }

  /// The fields used to create payment terms.
  public var paymentTerms: Swift.Optional<PaymentTermsInput?> {
    get {
      return graphQLMap["paymentTerms"] as? Swift.Optional<PaymentTermsInput?> ?? Swift.Optional<PaymentTermsInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "paymentTerms")
    }
  }

  /// The purchasing entity for this draft order.
  public var purchasingEntity: Swift.Optional<PurchasingEntityInput?> {
    get {
      return graphQLMap["purchasingEntity"] as? Swift.Optional<PurchasingEntityInput?> ?? Swift.Optional<PurchasingEntityInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "purchasingEntity")
    }
  }

  /// The source of the checkout.
  /// To use this field for sales attribution, you must register the channels that your app is managing.
  /// You can register the channels that your app is managing by completing
  /// [this Google Form](https://docs.google.com/forms/d/e/1FAIpQLScmVTZRQNjOJ7RD738mL1lGeFjqKVe_FM2tO9xsm21QEo5Ozg/viewform?usp=sf_link).
  /// After you've submitted your request, you need to wait for your request to be processed by Shopify.
  /// You can find a list of your channels in the Partner Dashboard, in your app's Marketplace extension.
  /// You need to specify the handle as the `source_name` value in your request.
  /// The handle is the channel that the order was placed from.
  public var sourceName: Swift.Optional<String?> {
    get {
      return graphQLMap["sourceName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sourceName")
    }
  }
}

/// The input fields for applying an order-level discount to a draft order.
public struct DraftOrderAppliedDiscountInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - amount: The applied amount of the discount.
  /// If the type of the discount is fixed amount, then this is the fixed dollar amount.
  /// If the type is percentage, then this is the subtotal multiplied by the percentage.
  ///   - description: Reason for the discount.
  ///   - title: Title of the discount.
  ///   - value: The value of the discount.
  /// If the type of the discount is fixed amount, then this is a fixed dollar amount.
  /// If the type is percentage, then this is the percentage.
  ///   - valueType: The type of discount.
  public init(amount: Swift.Optional<String?> = nil, description: Swift.Optional<String?> = nil, title: Swift.Optional<String?> = nil, value: Double, valueType: DraftOrderAppliedDiscountType) {
    graphQLMap = ["amount": amount, "description": description, "title": title, "value": value, "valueType": valueType]
  }

  /// The applied amount of the discount.
  /// If the type of the discount is fixed amount, then this is the fixed dollar amount.
  /// If the type is percentage, then this is the subtotal multiplied by the percentage.
  public var amount: Swift.Optional<String?> {
    get {
      return graphQLMap["amount"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  /// Reason for the discount.
  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  /// Title of the discount.
  public var title: Swift.Optional<String?> {
    get {
      return graphQLMap["title"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  /// The value of the discount.
  /// If the type of the discount is fixed amount, then this is a fixed dollar amount.
  /// If the type is percentage, then this is the percentage.
  public var value: Double {
    get {
      return graphQLMap["value"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }

  /// The type of discount.
  public var valueType: DraftOrderAppliedDiscountType {
    get {
      return graphQLMap["valueType"] as! DraftOrderAppliedDiscountType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "valueType")
    }
  }
}

/// The valid discount types that can be applied to a draft order.
public enum DraftOrderAppliedDiscountType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// A fixed amount in the store's currency.
  case fixedAmount
  /// A percentage of the order subtotal.
  case percentage
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "FIXED_AMOUNT": self = .fixedAmount
      case "PERCENTAGE": self = .percentage
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .fixedAmount: return "FIXED_AMOUNT"
      case .percentage: return "PERCENTAGE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DraftOrderAppliedDiscountType, rhs: DraftOrderAppliedDiscountType) -> Bool {
    switch (lhs, rhs) {
      case (.fixedAmount, .fixedAmount): return true
      case (.percentage, .percentage): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DraftOrderAppliedDiscountType] {
    return [
      .fixedAmount,
      .percentage,
    ]
  }
}

/// The input fields to create or update a mailing address.
public struct MailingAddressInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - address1: The first line of the address. Typically the street address or PO Box number.
  ///   - address2: The second line of the address. Typically the number of the apartment, suite, or unit.
  ///   - city: The name of the city, district, village, or town.
  ///   - company: The name of the customer's company or organization.
  ///   - countryCode: The two-letter code for the country of the address.
  ///   - firstName: The first name of the customer.
  ///   - lastName: The last name of the customer.
  ///   - phone: A unique phone number for the customer.
  /// 
  /// Formatted using E.164 standard. For example, _+16135551111_.
  ///   - provinceCode: The code for the region of the address, such as the province, state, or district.
  /// For example QC for Quebec, Canada.
  ///   - zip: The zip or postal code of the address.
  public init(address1: Swift.Optional<String?> = nil, address2: Swift.Optional<String?> = nil, city: Swift.Optional<String?> = nil, company: Swift.Optional<String?> = nil, countryCode: Swift.Optional<CountryCode?> = nil, firstName: Swift.Optional<String?> = nil, lastName: Swift.Optional<String?> = nil, phone: Swift.Optional<String?> = nil, provinceCode: Swift.Optional<String?> = nil, zip: Swift.Optional<String?> = nil) {
    graphQLMap = ["address1": address1, "address2": address2, "city": city, "company": company, "countryCode": countryCode, "firstName": firstName, "lastName": lastName, "phone": phone, "provinceCode": provinceCode, "zip": zip]
  }

  /// The first line of the address. Typically the street address or PO Box number.
  public var address1: Swift.Optional<String?> {
    get {
      return graphQLMap["address1"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address1")
    }
  }

  /// The second line of the address. Typically the number of the apartment, suite, or unit.
  public var address2: Swift.Optional<String?> {
    get {
      return graphQLMap["address2"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address2")
    }
  }

  /// The name of the city, district, village, or town.
  public var city: Swift.Optional<String?> {
    get {
      return graphQLMap["city"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "city")
    }
  }

  /// The name of the customer's company or organization.
  public var company: Swift.Optional<String?> {
    get {
      return graphQLMap["company"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "company")
    }
  }

  /// The two-letter code for the country of the address.
  public var countryCode: Swift.Optional<CountryCode?> {
    get {
      return graphQLMap["countryCode"] as? Swift.Optional<CountryCode?> ?? Swift.Optional<CountryCode?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "countryCode")
    }
  }

  /// The first name of the customer.
  public var firstName: Swift.Optional<String?> {
    get {
      return graphQLMap["firstName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  /// The last name of the customer.
  public var lastName: Swift.Optional<String?> {
    get {
      return graphQLMap["lastName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  /// A unique phone number for the customer.
  /// 
  /// Formatted using E.164 standard. For example, _+16135551111_.
  public var phone: Swift.Optional<String?> {
    get {
      return graphQLMap["phone"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phone")
    }
  }

  /// The code for the region of the address, such as the province, state, or district.
  /// For example QC for Quebec, Canada.
  public var provinceCode: Swift.Optional<String?> {
    get {
      return graphQLMap["provinceCode"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "provinceCode")
    }
  }

  /// The zip or postal code of the address.
  public var zip: Swift.Optional<String?> {
    get {
      return graphQLMap["zip"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "zip")
    }
  }
}

/// The code designating a country/region, which generally follows ISO 3166-1 alpha-2 guidelines.
/// If a territory doesn't have a country code value in the `CountryCode` enum, then it might be considered a subdivision
/// of another country. For example, the territories associated with Spain are represented by the country code `ES`,
/// and the territories associated with the United States of America are represented by the country code `US`.
public enum CountryCode: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Afghanistan.
  case af
  /// Åland Islands.
  case ax
  /// Albania.
  case al
  /// Algeria.
  case dz
  /// Andorra.
  case ad
  /// Angola.
  case ao
  /// Anguilla.
  case ai
  /// Antigua & Barbuda.
  case ag
  /// Argentina.
  case ar
  /// Armenia.
  case am
  /// Aruba.
  case aw
  /// Ascension Island.
  case ac
  /// Australia.
  case au
  /// Austria.
  case at
  /// Azerbaijan.
  case az
  /// Bahamas.
  case bs
  /// Bahrain.
  case bh
  /// Bangladesh.
  case bd
  /// Barbados.
  case bb
  /// Belarus.
  case by
  /// Belgium.
  case be
  /// Belize.
  case bz
  /// Benin.
  case bj
  /// Bermuda.
  case bm
  /// Bhutan.
  case bt
  /// Bolivia.
  case bo
  /// Bosnia & Herzegovina.
  case ba
  /// Botswana.
  case bw
  /// Bouvet Island.
  case bv
  /// Brazil.
  case br
  /// British Indian Ocean Territory.
  case io
  /// Brunei.
  case bn
  /// Bulgaria.
  case bg
  /// Burkina Faso.
  case bf
  /// Burundi.
  case bi
  /// Cambodia.
  case kh
  /// Canada.
  case ca
  /// Cape Verde.
  case cv
  /// Caribbean Netherlands.
  case bq
  /// Cayman Islands.
  case ky
  /// Central African Republic.
  case cf
  /// Chad.
  case td
  /// Chile.
  case cl
  /// China.
  case cn
  /// Christmas Island.
  case cx
  /// Cocos (Keeling) Islands.
  case cc
  /// Colombia.
  case co
  /// Comoros.
  case km
  /// Congo - Brazzaville.
  case cg
  /// Congo - Kinshasa.
  case cd
  /// Cook Islands.
  case ck
  /// Costa Rica.
  case cr
  /// Croatia.
  case hr
  /// Cuba.
  case cu
  /// Curaçao.
  case cw
  /// Cyprus.
  case cy
  /// Czechia.
  case cz
  /// Côte d’Ivoire.
  case ci
  /// Denmark.
  case dk
  /// Djibouti.
  case dj
  /// Dominica.
  case dm
  /// Dominican Republic.
  case `do`
  /// Ecuador.
  case ec
  /// Egypt.
  case eg
  /// El Salvador.
  case sv
  /// Equatorial Guinea.
  case gq
  /// Eritrea.
  case er
  /// Estonia.
  case ee
  /// Eswatini.
  case sz
  /// Ethiopia.
  case et
  /// Falkland Islands.
  case fk
  /// Faroe Islands.
  case fo
  /// Fiji.
  case fj
  /// Finland.
  case fi
  /// France.
  case fr
  /// French Guiana.
  case gf
  /// French Polynesia.
  case pf
  /// French Southern Territories.
  case tf
  /// Gabon.
  case ga
  /// Gambia.
  case gm
  /// Georgia.
  case ge
  /// Germany.
  case de
  /// Ghana.
  case gh
  /// Gibraltar.
  case gi
  /// Greece.
  case gr
  /// Greenland.
  case gl
  /// Grenada.
  case gd
  /// Guadeloupe.
  case gp
  /// Guatemala.
  case gt
  /// Guernsey.
  case gg
  /// Guinea.
  case gn
  /// Guinea-Bissau.
  case gw
  /// Guyana.
  case gy
  /// Haiti.
  case ht
  /// Heard & McDonald Islands.
  case hm
  /// Vatican City.
  case va
  /// Honduras.
  case hn
  /// Hong Kong SAR.
  case hk
  /// Hungary.
  case hu
  /// Iceland.
  case `is`
  /// India.
  case `in`
  /// Indonesia.
  case id
  /// Iran.
  case ir
  /// Iraq.
  case iq
  /// Ireland.
  case ie
  /// Isle of Man.
  case im
  /// Israel.
  case il
  /// Italy.
  case it
  /// Jamaica.
  case jm
  /// Japan.
  case jp
  /// Jersey.
  case je
  /// Jordan.
  case jo
  /// Kazakhstan.
  case kz
  /// Kenya.
  case ke
  /// Kiribati.
  case ki
  /// North Korea.
  case kp
  /// Kosovo.
  case xk
  /// Kuwait.
  case kw
  /// Kyrgyzstan.
  case kg
  /// Laos.
  case la
  /// Latvia.
  case lv
  /// Lebanon.
  case lb
  /// Lesotho.
  case ls
  /// Liberia.
  case lr
  /// Libya.
  case ly
  /// Liechtenstein.
  case li
  /// Lithuania.
  case lt
  /// Luxembourg.
  case lu
  /// Macao SAR.
  case mo
  /// Madagascar.
  case mg
  /// Malawi.
  case mw
  /// Malaysia.
  case my
  /// Maldives.
  case mv
  /// Mali.
  case ml
  /// Malta.
  case mt
  /// Martinique.
  case mq
  /// Mauritania.
  case mr
  /// Mauritius.
  case mu
  /// Mayotte.
  case yt
  /// Mexico.
  case mx
  /// Moldova.
  case md
  /// Monaco.
  case mc
  /// Mongolia.
  case mn
  /// Montenegro.
  case me
  /// Montserrat.
  case ms
  /// Morocco.
  case ma
  /// Mozambique.
  case mz
  /// Myanmar (Burma).
  case mm
  /// Namibia.
  case na
  /// Nauru.
  case nr
  /// Nepal.
  case np
  /// Netherlands.
  case nl
  /// Netherlands Antilles.
  case an
  /// New Caledonia.
  case nc
  /// New Zealand.
  case nz
  /// Nicaragua.
  case ni
  /// Niger.
  case ne
  /// Nigeria.
  case ng
  /// Niue.
  case nu
  /// Norfolk Island.
  case nf
  /// North Macedonia.
  case mk
  /// Norway.
  case no
  /// Oman.
  case om
  /// Pakistan.
  case pk
  /// Palestinian Territories.
  case ps
  /// Panama.
  case pa
  /// Papua New Guinea.
  case pg
  /// Paraguay.
  case py
  /// Peru.
  case pe
  /// Philippines.
  case ph
  /// Pitcairn Islands.
  case pn
  /// Poland.
  case pl
  /// Portugal.
  case pt
  /// Qatar.
  case qa
  /// Cameroon.
  case cm
  /// Réunion.
  case re
  /// Romania.
  case ro
  /// Russia.
  case ru
  /// Rwanda.
  case rw
  /// St. Barthélemy.
  case bl
  /// St. Helena.
  case sh
  /// St. Kitts & Nevis.
  case kn
  /// St. Lucia.
  case lc
  /// St. Martin.
  case mf
  /// St. Pierre & Miquelon.
  case pm
  /// Samoa.
  case ws
  /// San Marino.
  case sm
  /// São Tomé & Príncipe.
  case st
  /// Saudi Arabia.
  case sa
  /// Senegal.
  case sn
  /// Serbia.
  case rs
  /// Seychelles.
  case sc
  /// Sierra Leone.
  case sl
  /// Singapore.
  case sg
  /// Sint Maarten.
  case sx
  /// Slovakia.
  case sk
  /// Slovenia.
  case si
  /// Solomon Islands.
  case sb
  /// Somalia.
  case so
  /// South Africa.
  case za
  /// South Georgia & South Sandwich Islands.
  case gs
  /// South Korea.
  case kr
  /// South Sudan.
  case ss
  /// Spain.
  case es
  /// Sri Lanka.
  case lk
  /// St. Vincent & Grenadines.
  case vc
  /// Sudan.
  case sd
  /// Suriname.
  case sr
  /// Svalbard & Jan Mayen.
  case sj
  /// Sweden.
  case se
  /// Switzerland.
  case ch
  /// Syria.
  case sy
  /// Taiwan.
  case tw
  /// Tajikistan.
  case tj
  /// Tanzania.
  case tz
  /// Thailand.
  case th
  /// Timor-Leste.
  case tl
  /// Togo.
  case tg
  /// Tokelau.
  case tk
  /// Tonga.
  case to
  /// Trinidad & Tobago.
  case tt
  /// Tristan da Cunha.
  case ta
  /// Tunisia.
  case tn
  /// Turkey.
  case tr
  /// Turkmenistan.
  case tm
  /// Turks & Caicos Islands.
  case tc
  /// Tuvalu.
  case tv
  /// Uganda.
  case ug
  /// Ukraine.
  case ua
  /// United Arab Emirates.
  case ae
  /// United Kingdom.
  case gb
  /// United States.
  case us
  /// U.S. Outlying Islands.
  case um
  /// Uruguay.
  case uy
  /// Uzbekistan.
  case uz
  /// Vanuatu.
  case vu
  /// Venezuela.
  case ve
  /// Vietnam.
  case vn
  /// British Virgin Islands.
  case vg
  /// Wallis & Futuna.
  case wf
  /// Western Sahara.
  case eh
  /// Yemen.
  case ye
  /// Zambia.
  case zm
  /// Zimbabwe.
  case zw
  /// Unknown Region.
  case zz
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "AF": self = .af
      case "AX": self = .ax
      case "AL": self = .al
      case "DZ": self = .dz
      case "AD": self = .ad
      case "AO": self = .ao
      case "AI": self = .ai
      case "AG": self = .ag
      case "AR": self = .ar
      case "AM": self = .am
      case "AW": self = .aw
      case "AC": self = .ac
      case "AU": self = .au
      case "AT": self = .at
      case "AZ": self = .az
      case "BS": self = .bs
      case "BH": self = .bh
      case "BD": self = .bd
      case "BB": self = .bb
      case "BY": self = .by
      case "BE": self = .be
      case "BZ": self = .bz
      case "BJ": self = .bj
      case "BM": self = .bm
      case "BT": self = .bt
      case "BO": self = .bo
      case "BA": self = .ba
      case "BW": self = .bw
      case "BV": self = .bv
      case "BR": self = .br
      case "IO": self = .io
      case "BN": self = .bn
      case "BG": self = .bg
      case "BF": self = .bf
      case "BI": self = .bi
      case "KH": self = .kh
      case "CA": self = .ca
      case "CV": self = .cv
      case "BQ": self = .bq
      case "KY": self = .ky
      case "CF": self = .cf
      case "TD": self = .td
      case "CL": self = .cl
      case "CN": self = .cn
      case "CX": self = .cx
      case "CC": self = .cc
      case "CO": self = .co
      case "KM": self = .km
      case "CG": self = .cg
      case "CD": self = .cd
      case "CK": self = .ck
      case "CR": self = .cr
      case "HR": self = .hr
      case "CU": self = .cu
      case "CW": self = .cw
      case "CY": self = .cy
      case "CZ": self = .cz
      case "CI": self = .ci
      case "DK": self = .dk
      case "DJ": self = .dj
      case "DM": self = .dm
      case "DO": self = .do
      case "EC": self = .ec
      case "EG": self = .eg
      case "SV": self = .sv
      case "GQ": self = .gq
      case "ER": self = .er
      case "EE": self = .ee
      case "SZ": self = .sz
      case "ET": self = .et
      case "FK": self = .fk
      case "FO": self = .fo
      case "FJ": self = .fj
      case "FI": self = .fi
      case "FR": self = .fr
      case "GF": self = .gf
      case "PF": self = .pf
      case "TF": self = .tf
      case "GA": self = .ga
      case "GM": self = .gm
      case "GE": self = .ge
      case "DE": self = .de
      case "GH": self = .gh
      case "GI": self = .gi
      case "GR": self = .gr
      case "GL": self = .gl
      case "GD": self = .gd
      case "GP": self = .gp
      case "GT": self = .gt
      case "GG": self = .gg
      case "GN": self = .gn
      case "GW": self = .gw
      case "GY": self = .gy
      case "HT": self = .ht
      case "HM": self = .hm
      case "VA": self = .va
      case "HN": self = .hn
      case "HK": self = .hk
      case "HU": self = .hu
      case "IS": self = .is
      case "IN": self = .in
      case "ID": self = .id
      case "IR": self = .ir
      case "IQ": self = .iq
      case "IE": self = .ie
      case "IM": self = .im
      case "IL": self = .il
      case "IT": self = .it
      case "JM": self = .jm
      case "JP": self = .jp
      case "JE": self = .je
      case "JO": self = .jo
      case "KZ": self = .kz
      case "KE": self = .ke
      case "KI": self = .ki
      case "KP": self = .kp
      case "XK": self = .xk
      case "KW": self = .kw
      case "KG": self = .kg
      case "LA": self = .la
      case "LV": self = .lv
      case "LB": self = .lb
      case "LS": self = .ls
      case "LR": self = .lr
      case "LY": self = .ly
      case "LI": self = .li
      case "LT": self = .lt
      case "LU": self = .lu
      case "MO": self = .mo
      case "MG": self = .mg
      case "MW": self = .mw
      case "MY": self = .my
      case "MV": self = .mv
      case "ML": self = .ml
      case "MT": self = .mt
      case "MQ": self = .mq
      case "MR": self = .mr
      case "MU": self = .mu
      case "YT": self = .yt
      case "MX": self = .mx
      case "MD": self = .md
      case "MC": self = .mc
      case "MN": self = .mn
      case "ME": self = .me
      case "MS": self = .ms
      case "MA": self = .ma
      case "MZ": self = .mz
      case "MM": self = .mm
      case "NA": self = .na
      case "NR": self = .nr
      case "NP": self = .np
      case "NL": self = .nl
      case "AN": self = .an
      case "NC": self = .nc
      case "NZ": self = .nz
      case "NI": self = .ni
      case "NE": self = .ne
      case "NG": self = .ng
      case "NU": self = .nu
      case "NF": self = .nf
      case "MK": self = .mk
      case "NO": self = .no
      case "OM": self = .om
      case "PK": self = .pk
      case "PS": self = .ps
      case "PA": self = .pa
      case "PG": self = .pg
      case "PY": self = .py
      case "PE": self = .pe
      case "PH": self = .ph
      case "PN": self = .pn
      case "PL": self = .pl
      case "PT": self = .pt
      case "QA": self = .qa
      case "CM": self = .cm
      case "RE": self = .re
      case "RO": self = .ro
      case "RU": self = .ru
      case "RW": self = .rw
      case "BL": self = .bl
      case "SH": self = .sh
      case "KN": self = .kn
      case "LC": self = .lc
      case "MF": self = .mf
      case "PM": self = .pm
      case "WS": self = .ws
      case "SM": self = .sm
      case "ST": self = .st
      case "SA": self = .sa
      case "SN": self = .sn
      case "RS": self = .rs
      case "SC": self = .sc
      case "SL": self = .sl
      case "SG": self = .sg
      case "SX": self = .sx
      case "SK": self = .sk
      case "SI": self = .si
      case "SB": self = .sb
      case "SO": self = .so
      case "ZA": self = .za
      case "GS": self = .gs
      case "KR": self = .kr
      case "SS": self = .ss
      case "ES": self = .es
      case "LK": self = .lk
      case "VC": self = .vc
      case "SD": self = .sd
      case "SR": self = .sr
      case "SJ": self = .sj
      case "SE": self = .se
      case "CH": self = .ch
      case "SY": self = .sy
      case "TW": self = .tw
      case "TJ": self = .tj
      case "TZ": self = .tz
      case "TH": self = .th
      case "TL": self = .tl
      case "TG": self = .tg
      case "TK": self = .tk
      case "TO": self = .to
      case "TT": self = .tt
      case "TA": self = .ta
      case "TN": self = .tn
      case "TR": self = .tr
      case "TM": self = .tm
      case "TC": self = .tc
      case "TV": self = .tv
      case "UG": self = .ug
      case "UA": self = .ua
      case "AE": self = .ae
      case "GB": self = .gb
      case "US": self = .us
      case "UM": self = .um
      case "UY": self = .uy
      case "UZ": self = .uz
      case "VU": self = .vu
      case "VE": self = .ve
      case "VN": self = .vn
      case "VG": self = .vg
      case "WF": self = .wf
      case "EH": self = .eh
      case "YE": self = .ye
      case "ZM": self = .zm
      case "ZW": self = .zw
      case "ZZ": self = .zz
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .af: return "AF"
      case .ax: return "AX"
      case .al: return "AL"
      case .dz: return "DZ"
      case .ad: return "AD"
      case .ao: return "AO"
      case .ai: return "AI"
      case .ag: return "AG"
      case .ar: return "AR"
      case .am: return "AM"
      case .aw: return "AW"
      case .ac: return "AC"
      case .au: return "AU"
      case .at: return "AT"
      case .az: return "AZ"
      case .bs: return "BS"
      case .bh: return "BH"
      case .bd: return "BD"
      case .bb: return "BB"
      case .by: return "BY"
      case .be: return "BE"
      case .bz: return "BZ"
      case .bj: return "BJ"
      case .bm: return "BM"
      case .bt: return "BT"
      case .bo: return "BO"
      case .ba: return "BA"
      case .bw: return "BW"
      case .bv: return "BV"
      case .br: return "BR"
      case .io: return "IO"
      case .bn: return "BN"
      case .bg: return "BG"
      case .bf: return "BF"
      case .bi: return "BI"
      case .kh: return "KH"
      case .ca: return "CA"
      case .cv: return "CV"
      case .bq: return "BQ"
      case .ky: return "KY"
      case .cf: return "CF"
      case .td: return "TD"
      case .cl: return "CL"
      case .cn: return "CN"
      case .cx: return "CX"
      case .cc: return "CC"
      case .co: return "CO"
      case .km: return "KM"
      case .cg: return "CG"
      case .cd: return "CD"
      case .ck: return "CK"
      case .cr: return "CR"
      case .hr: return "HR"
      case .cu: return "CU"
      case .cw: return "CW"
      case .cy: return "CY"
      case .cz: return "CZ"
      case .ci: return "CI"
      case .dk: return "DK"
      case .dj: return "DJ"
      case .dm: return "DM"
      case .do: return "DO"
      case .ec: return "EC"
      case .eg: return "EG"
      case .sv: return "SV"
      case .gq: return "GQ"
      case .er: return "ER"
      case .ee: return "EE"
      case .sz: return "SZ"
      case .et: return "ET"
      case .fk: return "FK"
      case .fo: return "FO"
      case .fj: return "FJ"
      case .fi: return "FI"
      case .fr: return "FR"
      case .gf: return "GF"
      case .pf: return "PF"
      case .tf: return "TF"
      case .ga: return "GA"
      case .gm: return "GM"
      case .ge: return "GE"
      case .de: return "DE"
      case .gh: return "GH"
      case .gi: return "GI"
      case .gr: return "GR"
      case .gl: return "GL"
      case .gd: return "GD"
      case .gp: return "GP"
      case .gt: return "GT"
      case .gg: return "GG"
      case .gn: return "GN"
      case .gw: return "GW"
      case .gy: return "GY"
      case .ht: return "HT"
      case .hm: return "HM"
      case .va: return "VA"
      case .hn: return "HN"
      case .hk: return "HK"
      case .hu: return "HU"
      case .is: return "IS"
      case .in: return "IN"
      case .id: return "ID"
      case .ir: return "IR"
      case .iq: return "IQ"
      case .ie: return "IE"
      case .im: return "IM"
      case .il: return "IL"
      case .it: return "IT"
      case .jm: return "JM"
      case .jp: return "JP"
      case .je: return "JE"
      case .jo: return "JO"
      case .kz: return "KZ"
      case .ke: return "KE"
      case .ki: return "KI"
      case .kp: return "KP"
      case .xk: return "XK"
      case .kw: return "KW"
      case .kg: return "KG"
      case .la: return "LA"
      case .lv: return "LV"
      case .lb: return "LB"
      case .ls: return "LS"
      case .lr: return "LR"
      case .ly: return "LY"
      case .li: return "LI"
      case .lt: return "LT"
      case .lu: return "LU"
      case .mo: return "MO"
      case .mg: return "MG"
      case .mw: return "MW"
      case .my: return "MY"
      case .mv: return "MV"
      case .ml: return "ML"
      case .mt: return "MT"
      case .mq: return "MQ"
      case .mr: return "MR"
      case .mu: return "MU"
      case .yt: return "YT"
      case .mx: return "MX"
      case .md: return "MD"
      case .mc: return "MC"
      case .mn: return "MN"
      case .me: return "ME"
      case .ms: return "MS"
      case .ma: return "MA"
      case .mz: return "MZ"
      case .mm: return "MM"
      case .na: return "NA"
      case .nr: return "NR"
      case .np: return "NP"
      case .nl: return "NL"
      case .an: return "AN"
      case .nc: return "NC"
      case .nz: return "NZ"
      case .ni: return "NI"
      case .ne: return "NE"
      case .ng: return "NG"
      case .nu: return "NU"
      case .nf: return "NF"
      case .mk: return "MK"
      case .no: return "NO"
      case .om: return "OM"
      case .pk: return "PK"
      case .ps: return "PS"
      case .pa: return "PA"
      case .pg: return "PG"
      case .py: return "PY"
      case .pe: return "PE"
      case .ph: return "PH"
      case .pn: return "PN"
      case .pl: return "PL"
      case .pt: return "PT"
      case .qa: return "QA"
      case .cm: return "CM"
      case .re: return "RE"
      case .ro: return "RO"
      case .ru: return "RU"
      case .rw: return "RW"
      case .bl: return "BL"
      case .sh: return "SH"
      case .kn: return "KN"
      case .lc: return "LC"
      case .mf: return "MF"
      case .pm: return "PM"
      case .ws: return "WS"
      case .sm: return "SM"
      case .st: return "ST"
      case .sa: return "SA"
      case .sn: return "SN"
      case .rs: return "RS"
      case .sc: return "SC"
      case .sl: return "SL"
      case .sg: return "SG"
      case .sx: return "SX"
      case .sk: return "SK"
      case .si: return "SI"
      case .sb: return "SB"
      case .so: return "SO"
      case .za: return "ZA"
      case .gs: return "GS"
      case .kr: return "KR"
      case .ss: return "SS"
      case .es: return "ES"
      case .lk: return "LK"
      case .vc: return "VC"
      case .sd: return "SD"
      case .sr: return "SR"
      case .sj: return "SJ"
      case .se: return "SE"
      case .ch: return "CH"
      case .sy: return "SY"
      case .tw: return "TW"
      case .tj: return "TJ"
      case .tz: return "TZ"
      case .th: return "TH"
      case .tl: return "TL"
      case .tg: return "TG"
      case .tk: return "TK"
      case .to: return "TO"
      case .tt: return "TT"
      case .ta: return "TA"
      case .tn: return "TN"
      case .tr: return "TR"
      case .tm: return "TM"
      case .tc: return "TC"
      case .tv: return "TV"
      case .ug: return "UG"
      case .ua: return "UA"
      case .ae: return "AE"
      case .gb: return "GB"
      case .us: return "US"
      case .um: return "UM"
      case .uy: return "UY"
      case .uz: return "UZ"
      case .vu: return "VU"
      case .ve: return "VE"
      case .vn: return "VN"
      case .vg: return "VG"
      case .wf: return "WF"
      case .eh: return "EH"
      case .ye: return "YE"
      case .zm: return "ZM"
      case .zw: return "ZW"
      case .zz: return "ZZ"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CountryCode, rhs: CountryCode) -> Bool {
    switch (lhs, rhs) {
      case (.af, .af): return true
      case (.ax, .ax): return true
      case (.al, .al): return true
      case (.dz, .dz): return true
      case (.ad, .ad): return true
      case (.ao, .ao): return true
      case (.ai, .ai): return true
      case (.ag, .ag): return true
      case (.ar, .ar): return true
      case (.am, .am): return true
      case (.aw, .aw): return true
      case (.ac, .ac): return true
      case (.au, .au): return true
      case (.at, .at): return true
      case (.az, .az): return true
      case (.bs, .bs): return true
      case (.bh, .bh): return true
      case (.bd, .bd): return true
      case (.bb, .bb): return true
      case (.by, .by): return true
      case (.be, .be): return true
      case (.bz, .bz): return true
      case (.bj, .bj): return true
      case (.bm, .bm): return true
      case (.bt, .bt): return true
      case (.bo, .bo): return true
      case (.ba, .ba): return true
      case (.bw, .bw): return true
      case (.bv, .bv): return true
      case (.br, .br): return true
      case (.io, .io): return true
      case (.bn, .bn): return true
      case (.bg, .bg): return true
      case (.bf, .bf): return true
      case (.bi, .bi): return true
      case (.kh, .kh): return true
      case (.ca, .ca): return true
      case (.cv, .cv): return true
      case (.bq, .bq): return true
      case (.ky, .ky): return true
      case (.cf, .cf): return true
      case (.td, .td): return true
      case (.cl, .cl): return true
      case (.cn, .cn): return true
      case (.cx, .cx): return true
      case (.cc, .cc): return true
      case (.co, .co): return true
      case (.km, .km): return true
      case (.cg, .cg): return true
      case (.cd, .cd): return true
      case (.ck, .ck): return true
      case (.cr, .cr): return true
      case (.hr, .hr): return true
      case (.cu, .cu): return true
      case (.cw, .cw): return true
      case (.cy, .cy): return true
      case (.cz, .cz): return true
      case (.ci, .ci): return true
      case (.dk, .dk): return true
      case (.dj, .dj): return true
      case (.dm, .dm): return true
      case (.do, .do): return true
      case (.ec, .ec): return true
      case (.eg, .eg): return true
      case (.sv, .sv): return true
      case (.gq, .gq): return true
      case (.er, .er): return true
      case (.ee, .ee): return true
      case (.sz, .sz): return true
      case (.et, .et): return true
      case (.fk, .fk): return true
      case (.fo, .fo): return true
      case (.fj, .fj): return true
      case (.fi, .fi): return true
      case (.fr, .fr): return true
      case (.gf, .gf): return true
      case (.pf, .pf): return true
      case (.tf, .tf): return true
      case (.ga, .ga): return true
      case (.gm, .gm): return true
      case (.ge, .ge): return true
      case (.de, .de): return true
      case (.gh, .gh): return true
      case (.gi, .gi): return true
      case (.gr, .gr): return true
      case (.gl, .gl): return true
      case (.gd, .gd): return true
      case (.gp, .gp): return true
      case (.gt, .gt): return true
      case (.gg, .gg): return true
      case (.gn, .gn): return true
      case (.gw, .gw): return true
      case (.gy, .gy): return true
      case (.ht, .ht): return true
      case (.hm, .hm): return true
      case (.va, .va): return true
      case (.hn, .hn): return true
      case (.hk, .hk): return true
      case (.hu, .hu): return true
      case (.is, .is): return true
      case (.in, .in): return true
      case (.id, .id): return true
      case (.ir, .ir): return true
      case (.iq, .iq): return true
      case (.ie, .ie): return true
      case (.im, .im): return true
      case (.il, .il): return true
      case (.it, .it): return true
      case (.jm, .jm): return true
      case (.jp, .jp): return true
      case (.je, .je): return true
      case (.jo, .jo): return true
      case (.kz, .kz): return true
      case (.ke, .ke): return true
      case (.ki, .ki): return true
      case (.kp, .kp): return true
      case (.xk, .xk): return true
      case (.kw, .kw): return true
      case (.kg, .kg): return true
      case (.la, .la): return true
      case (.lv, .lv): return true
      case (.lb, .lb): return true
      case (.ls, .ls): return true
      case (.lr, .lr): return true
      case (.ly, .ly): return true
      case (.li, .li): return true
      case (.lt, .lt): return true
      case (.lu, .lu): return true
      case (.mo, .mo): return true
      case (.mg, .mg): return true
      case (.mw, .mw): return true
      case (.my, .my): return true
      case (.mv, .mv): return true
      case (.ml, .ml): return true
      case (.mt, .mt): return true
      case (.mq, .mq): return true
      case (.mr, .mr): return true
      case (.mu, .mu): return true
      case (.yt, .yt): return true
      case (.mx, .mx): return true
      case (.md, .md): return true
      case (.mc, .mc): return true
      case (.mn, .mn): return true
      case (.me, .me): return true
      case (.ms, .ms): return true
      case (.ma, .ma): return true
      case (.mz, .mz): return true
      case (.mm, .mm): return true
      case (.na, .na): return true
      case (.nr, .nr): return true
      case (.np, .np): return true
      case (.nl, .nl): return true
      case (.an, .an): return true
      case (.nc, .nc): return true
      case (.nz, .nz): return true
      case (.ni, .ni): return true
      case (.ne, .ne): return true
      case (.ng, .ng): return true
      case (.nu, .nu): return true
      case (.nf, .nf): return true
      case (.mk, .mk): return true
      case (.no, .no): return true
      case (.om, .om): return true
      case (.pk, .pk): return true
      case (.ps, .ps): return true
      case (.pa, .pa): return true
      case (.pg, .pg): return true
      case (.py, .py): return true
      case (.pe, .pe): return true
      case (.ph, .ph): return true
      case (.pn, .pn): return true
      case (.pl, .pl): return true
      case (.pt, .pt): return true
      case (.qa, .qa): return true
      case (.cm, .cm): return true
      case (.re, .re): return true
      case (.ro, .ro): return true
      case (.ru, .ru): return true
      case (.rw, .rw): return true
      case (.bl, .bl): return true
      case (.sh, .sh): return true
      case (.kn, .kn): return true
      case (.lc, .lc): return true
      case (.mf, .mf): return true
      case (.pm, .pm): return true
      case (.ws, .ws): return true
      case (.sm, .sm): return true
      case (.st, .st): return true
      case (.sa, .sa): return true
      case (.sn, .sn): return true
      case (.rs, .rs): return true
      case (.sc, .sc): return true
      case (.sl, .sl): return true
      case (.sg, .sg): return true
      case (.sx, .sx): return true
      case (.sk, .sk): return true
      case (.si, .si): return true
      case (.sb, .sb): return true
      case (.so, .so): return true
      case (.za, .za): return true
      case (.gs, .gs): return true
      case (.kr, .kr): return true
      case (.ss, .ss): return true
      case (.es, .es): return true
      case (.lk, .lk): return true
      case (.vc, .vc): return true
      case (.sd, .sd): return true
      case (.sr, .sr): return true
      case (.sj, .sj): return true
      case (.se, .se): return true
      case (.ch, .ch): return true
      case (.sy, .sy): return true
      case (.tw, .tw): return true
      case (.tj, .tj): return true
      case (.tz, .tz): return true
      case (.th, .th): return true
      case (.tl, .tl): return true
      case (.tg, .tg): return true
      case (.tk, .tk): return true
      case (.to, .to): return true
      case (.tt, .tt): return true
      case (.ta, .ta): return true
      case (.tn, .tn): return true
      case (.tr, .tr): return true
      case (.tm, .tm): return true
      case (.tc, .tc): return true
      case (.tv, .tv): return true
      case (.ug, .ug): return true
      case (.ua, .ua): return true
      case (.ae, .ae): return true
      case (.gb, .gb): return true
      case (.us, .us): return true
      case (.um, .um): return true
      case (.uy, .uy): return true
      case (.uz, .uz): return true
      case (.vu, .vu): return true
      case (.ve, .ve): return true
      case (.vn, .vn): return true
      case (.vg, .vg): return true
      case (.wf, .wf): return true
      case (.eh, .eh): return true
      case (.ye, .ye): return true
      case (.zm, .zm): return true
      case (.zw, .zw): return true
      case (.zz, .zz): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CountryCode] {
    return [
      .af,
      .ax,
      .al,
      .dz,
      .ad,
      .ao,
      .ai,
      .ag,
      .ar,
      .am,
      .aw,
      .ac,
      .au,
      .at,
      .az,
      .bs,
      .bh,
      .bd,
      .bb,
      .by,
      .be,
      .bz,
      .bj,
      .bm,
      .bt,
      .bo,
      .ba,
      .bw,
      .bv,
      .br,
      .io,
      .bn,
      .bg,
      .bf,
      .bi,
      .kh,
      .ca,
      .cv,
      .bq,
      .ky,
      .cf,
      .td,
      .cl,
      .cn,
      .cx,
      .cc,
      .co,
      .km,
      .cg,
      .cd,
      .ck,
      .cr,
      .hr,
      .cu,
      .cw,
      .cy,
      .cz,
      .ci,
      .dk,
      .dj,
      .dm,
      .do,
      .ec,
      .eg,
      .sv,
      .gq,
      .er,
      .ee,
      .sz,
      .et,
      .fk,
      .fo,
      .fj,
      .fi,
      .fr,
      .gf,
      .pf,
      .tf,
      .ga,
      .gm,
      .ge,
      .de,
      .gh,
      .gi,
      .gr,
      .gl,
      .gd,
      .gp,
      .gt,
      .gg,
      .gn,
      .gw,
      .gy,
      .ht,
      .hm,
      .va,
      .hn,
      .hk,
      .hu,
      .is,
      .in,
      .id,
      .ir,
      .iq,
      .ie,
      .im,
      .il,
      .it,
      .jm,
      .jp,
      .je,
      .jo,
      .kz,
      .ke,
      .ki,
      .kp,
      .xk,
      .kw,
      .kg,
      .la,
      .lv,
      .lb,
      .ls,
      .lr,
      .ly,
      .li,
      .lt,
      .lu,
      .mo,
      .mg,
      .mw,
      .my,
      .mv,
      .ml,
      .mt,
      .mq,
      .mr,
      .mu,
      .yt,
      .mx,
      .md,
      .mc,
      .mn,
      .me,
      .ms,
      .ma,
      .mz,
      .mm,
      .na,
      .nr,
      .np,
      .nl,
      .an,
      .nc,
      .nz,
      .ni,
      .ne,
      .ng,
      .nu,
      .nf,
      .mk,
      .no,
      .om,
      .pk,
      .ps,
      .pa,
      .pg,
      .py,
      .pe,
      .ph,
      .pn,
      .pl,
      .pt,
      .qa,
      .cm,
      .re,
      .ro,
      .ru,
      .rw,
      .bl,
      .sh,
      .kn,
      .lc,
      .mf,
      .pm,
      .ws,
      .sm,
      .st,
      .sa,
      .sn,
      .rs,
      .sc,
      .sl,
      .sg,
      .sx,
      .sk,
      .si,
      .sb,
      .so,
      .za,
      .gs,
      .kr,
      .ss,
      .es,
      .lk,
      .vc,
      .sd,
      .sr,
      .sj,
      .se,
      .ch,
      .sy,
      .tw,
      .tj,
      .tz,
      .th,
      .tl,
      .tg,
      .tk,
      .to,
      .tt,
      .ta,
      .tn,
      .tr,
      .tm,
      .tc,
      .tv,
      .ug,
      .ua,
      .ae,
      .gb,
      .us,
      .um,
      .uy,
      .uz,
      .vu,
      .ve,
      .vn,
      .vg,
      .wf,
      .eh,
      .ye,
      .zm,
      .zw,
      .zz,
    ]
  }
}

/// The input fields for an attribute.
public struct AttributeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - key: Key or name of the attribute.
  ///   - value: Value of the attribute.
  public init(key: String, value: String) {
    graphQLMap = ["key": key, "value": value]
  }

  /// Key or name of the attribute.
  public var key: String {
    get {
      return graphQLMap["key"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "key")
    }
  }

  /// Value of the attribute.
  public var value: String {
    get {
      return graphQLMap["value"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }
}

/// The input fields used to create a line item for a draft order.
public struct DraftOrderLineItemInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - appliedDiscount: Discount which will be applied to the line item.
  ///   - customAttributes: Represents a generic custom attribute using a key value pair.
  ///   - originalUnitPrice: The price without any discounts applied. This value is ignored when `variantId` is provided.
  ///   - quantity: The number of products that were purchased.
  ///   - requiresShipping: Whether physical shipping is required. This value is ignored when `variantId` is provided.
  ///   - sku: The SKU number of the item. This value is ignored when `variantId` is provided.
  ///   - taxable: Whether the item is taxable. This value is ignored when `variantId` is provided.
  ///   - title: Title of the item. Ignored when `variantId` is provided.
  ///   - variantId: The ID of the product variant corresponding to the line item.
  /// Null if custom line item. Required if product variant line item.
  ///   - weight: Specifies the weight unit and value inputs.
  /// This value is ignored when `variantId` is provided.
  public init(appliedDiscount: Swift.Optional<DraftOrderAppliedDiscountInput?> = nil, customAttributes: Swift.Optional<[AttributeInput]?> = nil, originalUnitPrice: Swift.Optional<String?> = nil, quantity: Int, requiresShipping: Swift.Optional<Bool?> = nil, sku: Swift.Optional<String?> = nil, taxable: Swift.Optional<Bool?> = nil, title: Swift.Optional<String?> = nil, variantId: Swift.Optional<GraphQLID?> = nil, weight: Swift.Optional<WeightInput?> = nil) {
    graphQLMap = ["appliedDiscount": appliedDiscount, "customAttributes": customAttributes, "originalUnitPrice": originalUnitPrice, "quantity": quantity, "requiresShipping": requiresShipping, "sku": sku, "taxable": taxable, "title": title, "variantId": variantId, "weight": weight]
  }

  /// Discount which will be applied to the line item.
  public var appliedDiscount: Swift.Optional<DraftOrderAppliedDiscountInput?> {
    get {
      return graphQLMap["appliedDiscount"] as? Swift.Optional<DraftOrderAppliedDiscountInput?> ?? Swift.Optional<DraftOrderAppliedDiscountInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "appliedDiscount")
    }
  }

  /// Represents a generic custom attribute using a key value pair.
  public var customAttributes: Swift.Optional<[AttributeInput]?> {
    get {
      return graphQLMap["customAttributes"] as? Swift.Optional<[AttributeInput]?> ?? Swift.Optional<[AttributeInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "customAttributes")
    }
  }

  /// The price without any discounts applied. This value is ignored when `variantId` is provided.
  public var originalUnitPrice: Swift.Optional<String?> {
    get {
      return graphQLMap["originalUnitPrice"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "originalUnitPrice")
    }
  }

  /// The number of products that were purchased.
  public var quantity: Int {
    get {
      return graphQLMap["quantity"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "quantity")
    }
  }

  /// Whether physical shipping is required. This value is ignored when `variantId` is provided.
  public var requiresShipping: Swift.Optional<Bool?> {
    get {
      return graphQLMap["requiresShipping"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "requiresShipping")
    }
  }

  /// The SKU number of the item. This value is ignored when `variantId` is provided.
  public var sku: Swift.Optional<String?> {
    get {
      return graphQLMap["sku"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sku")
    }
  }

  /// Whether the item is taxable. This value is ignored when `variantId` is provided.
  public var taxable: Swift.Optional<Bool?> {
    get {
      return graphQLMap["taxable"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "taxable")
    }
  }

  /// Title of the item. Ignored when `variantId` is provided.
  public var title: Swift.Optional<String?> {
    get {
      return graphQLMap["title"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  /// The ID of the product variant corresponding to the line item.
  /// Null if custom line item. Required if product variant line item.
  public var variantId: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["variantId"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "variantId")
    }
  }

  /// Specifies the weight unit and value inputs.
  /// This value is ignored when `variantId` is provided.
  public var weight: Swift.Optional<WeightInput?> {
    get {
      return graphQLMap["weight"] as? Swift.Optional<WeightInput?> ?? Swift.Optional<WeightInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weight")
    }
  }
}

/// The input fields for the weight unit and value inputs.
public struct WeightInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - value: The weight value using the unit system specified with `weight_unit`.
  ///   - unit: Unit of measurement for `value`.
  public init(value: Double, unit: WeightUnit) {
    graphQLMap = ["value": value, "unit": unit]
  }

  /// The weight value using the unit system specified with `weight_unit`.
  public var value: Double {
    get {
      return graphQLMap["value"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }

  /// Unit of measurement for `value`.
  public var unit: WeightUnit {
    get {
      return graphQLMap["unit"] as! WeightUnit
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "unit")
    }
  }
}

/// Units of measurement for weight.
public enum WeightUnit: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// 1 kilogram equals 1000 grams.
  case kilograms
  /// Metric system unit of mass.
  case grams
  /// 1 pound equals 16 ounces.
  case pounds
  /// Imperial system unit of mass.
  case ounces
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "KILOGRAMS": self = .kilograms
      case "GRAMS": self = .grams
      case "POUNDS": self = .pounds
      case "OUNCES": self = .ounces
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .kilograms: return "KILOGRAMS"
      case .grams: return "GRAMS"
      case .pounds: return "POUNDS"
      case .ounces: return "OUNCES"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: WeightUnit, rhs: WeightUnit) -> Bool {
    switch (lhs, rhs) {
      case (.kilograms, .kilograms): return true
      case (.grams, .grams): return true
      case (.pounds, .pounds): return true
      case (.ounces, .ounces): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [WeightUnit] {
    return [
      .kilograms,
      .grams,
      .pounds,
      .ounces,
    ]
  }
}

/// The input fields to use to create or update a metafield through a mutation on the owning resource.
/// An alternative way to create or update a metafield is by using the
/// [metafieldsSet](https://shopify.dev/api/admin-graphql/latest/mutations/metafieldsSet) mutation.
public struct MetafieldInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id: The unique ID of the metafield.
  /// 
  /// Required when updating a metafield, but should not be included when creating as it's created automatically.
  ///   - namespace: The container for a group of metafields that the metafield is or will be associated with. Used in tandem with
  /// `key` to lookup a metafield on a resource, preventing conflicts with other metafields with the same `key`.
  /// 
  /// Required when creating a metafield, but optional when updating. Used to help identify the metafield when
  /// updating, but cannot be updated itself.
  /// 
  /// Must be 3-255 characters long and can contain alphanumeric, hyphen, and underscore characters.
  ///   - key: The unique identifier for a metafield within its namespace.
  /// 
  /// Required when creating a metafield, but optional when updating. Used to help identify the metafield when
  /// updating, but cannot be updated itself.
  /// 
  /// Must be 3-64 characters long and can contain alphanumeric, hyphen, and underscore characters.
  ///   - value: The data stored in the metafield. Always stored as a string, regardless of the metafield's type.
  ///   - type: The type of data that is stored in the metafield.
  /// Refer to the list of [supported types](https://shopify.dev/apps/metafields/types).
  /// 
  /// Required when creating a metafield, but optional when updating.
  public init(id: Swift.Optional<GraphQLID?> = nil, namespace: Swift.Optional<String?> = nil, key: Swift.Optional<String?> = nil, value: Swift.Optional<String?> = nil, type: Swift.Optional<String?> = nil) {
    graphQLMap = ["id": id, "namespace": namespace, "key": key, "value": value, "type": type]
  }

  /// The unique ID of the metafield.
  /// 
  /// Required when updating a metafield, but should not be included when creating as it's created automatically.
  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The container for a group of metafields that the metafield is or will be associated with. Used in tandem with
  /// `key` to lookup a metafield on a resource, preventing conflicts with other metafields with the same `key`.
  /// 
  /// Required when creating a metafield, but optional when updating. Used to help identify the metafield when
  /// updating, but cannot be updated itself.
  /// 
  /// Must be 3-255 characters long and can contain alphanumeric, hyphen, and underscore characters.
  public var namespace: Swift.Optional<String?> {
    get {
      return graphQLMap["namespace"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "namespace")
    }
  }

  /// The unique identifier for a metafield within its namespace.
  /// 
  /// Required when creating a metafield, but optional when updating. Used to help identify the metafield when
  /// updating, but cannot be updated itself.
  /// 
  /// Must be 3-64 characters long and can contain alphanumeric, hyphen, and underscore characters.
  public var key: Swift.Optional<String?> {
    get {
      return graphQLMap["key"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "key")
    }
  }

  /// The data stored in the metafield. Always stored as a string, regardless of the metafield's type.
  public var value: Swift.Optional<String?> {
    get {
      return graphQLMap["value"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }

  /// The type of data that is stored in the metafield.
  /// Refer to the list of [supported types](https://shopify.dev/apps/metafields/types).
  /// 
  /// Required when creating a metafield, but optional when updating.
  public var type: Swift.Optional<String?> {
    get {
      return graphQLMap["type"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }
}

/// The input fields for a LocalizationExtensionInput.
public struct LocalizationExtensionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - key: The key for the localization extension.
  ///   - value: The localization extension value.
  public init(key: LocalizationExtensionKey, value: String) {
    graphQLMap = ["key": key, "value": value]
  }

  /// The key for the localization extension.
  public var key: LocalizationExtensionKey {
    get {
      return graphQLMap["key"] as! LocalizationExtensionKey
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "key")
    }
  }

  /// The localization extension value.
  public var value: String {
    get {
      return graphQLMap["value"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }
}

/// The key of a localization extension.
public enum LocalizationExtensionKey: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Extension key 'tax_credential_br' for country BR.
  case taxCredentialBr
  /// Extension key 'shipping_credential_br' for country BR.
  case shippingCredentialBr
  /// Extension key 'shipping_credential_cn' for country CN.
  case shippingCredentialCn
  /// Extension key 'tax_credential_it' for country IT.
  case taxCredentialIt
  /// Extension key 'tax_email_it' for country IT.
  case taxEmailIt
  /// Extension key 'shipping_credential_kr' for country KR.
  case shippingCredentialKr
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "TAX_CREDENTIAL_BR": self = .taxCredentialBr
      case "SHIPPING_CREDENTIAL_BR": self = .shippingCredentialBr
      case "SHIPPING_CREDENTIAL_CN": self = .shippingCredentialCn
      case "TAX_CREDENTIAL_IT": self = .taxCredentialIt
      case "TAX_EMAIL_IT": self = .taxEmailIt
      case "SHIPPING_CREDENTIAL_KR": self = .shippingCredentialKr
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .taxCredentialBr: return "TAX_CREDENTIAL_BR"
      case .shippingCredentialBr: return "SHIPPING_CREDENTIAL_BR"
      case .shippingCredentialCn: return "SHIPPING_CREDENTIAL_CN"
      case .taxCredentialIt: return "TAX_CREDENTIAL_IT"
      case .taxEmailIt: return "TAX_EMAIL_IT"
      case .shippingCredentialKr: return "SHIPPING_CREDENTIAL_KR"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: LocalizationExtensionKey, rhs: LocalizationExtensionKey) -> Bool {
    switch (lhs, rhs) {
      case (.taxCredentialBr, .taxCredentialBr): return true
      case (.shippingCredentialBr, .shippingCredentialBr): return true
      case (.shippingCredentialCn, .shippingCredentialCn): return true
      case (.taxCredentialIt, .taxCredentialIt): return true
      case (.taxEmailIt, .taxEmailIt): return true
      case (.shippingCredentialKr, .shippingCredentialKr): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [LocalizationExtensionKey] {
    return [
      .taxCredentialBr,
      .shippingCredentialBr,
      .shippingCredentialCn,
      .taxCredentialIt,
      .taxEmailIt,
      .shippingCredentialKr,
    ]
  }
}

/// The input fields for specifying the shipping details for the order.
public struct ShippingLineInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - price: Price of the shipping rate.
  ///   - shippingRateHandle: A unique identifier for the shipping rate.
  ///   - title: Title of the shipping rate.
  public init(price: Swift.Optional<String?> = nil, shippingRateHandle: Swift.Optional<String?> = nil, title: Swift.Optional<String?> = nil) {
    graphQLMap = ["price": price, "shippingRateHandle": shippingRateHandle, "title": title]
  }

  /// Price of the shipping rate.
  public var price: Swift.Optional<String?> {
    get {
      return graphQLMap["price"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }

  /// A unique identifier for the shipping rate.
  public var shippingRateHandle: Swift.Optional<String?> {
    get {
      return graphQLMap["shippingRateHandle"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "shippingRateHandle")
    }
  }

  /// Title of the shipping rate.
  public var title: Swift.Optional<String?> {
    get {
      return graphQLMap["title"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }
}


/// The input fields used to create a payment terms.
public struct PaymentTermsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - paymentTermsTemplateId: Specifies the payment terms template ID used to generate payment terms.
  ///   - paymentSchedules: Specifies the payment schedules for the payment terms.
  public init(paymentTermsTemplateId: Swift.Optional<GraphQLID?> = nil, paymentSchedules: Swift.Optional<[PaymentScheduleInput]?> = nil) {
    graphQLMap = ["paymentTermsTemplateId": paymentTermsTemplateId, "paymentSchedules": paymentSchedules]
  }

  /// Specifies the payment terms template ID used to generate payment terms.
  public var paymentTermsTemplateId: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["paymentTermsTemplateId"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "paymentTermsTemplateId")
    }
  }

  /// Specifies the payment schedules for the payment terms.
  public var paymentSchedules: Swift.Optional<[PaymentScheduleInput]?> {
    get {
      return graphQLMap["paymentSchedules"] as? Swift.Optional<[PaymentScheduleInput]?> ?? Swift.Optional<[PaymentScheduleInput]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "paymentSchedules")
    }
  }
}

/// The input fields used to create a payment schedule for payment terms.
public struct PaymentScheduleInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - issuedAt: Specifies the date and time that the payment schedule was issued. This field must be provided for net type payment terms.
  ///   - dueAt: Specifies the date and time when the payment schedule is due. This field must be provided for fixed type payment terms.
  public init(issuedAt: Swift.Optional<String?> = nil, dueAt: Swift.Optional<String?> = nil) {
    graphQLMap = ["issuedAt": issuedAt, "dueAt": dueAt]
  }

  /// Specifies the date and time that the payment schedule was issued. This field must be provided for net type payment terms.
  public var issuedAt: Swift.Optional<String?> {
    get {
      return graphQLMap["issuedAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "issuedAt")
    }
  }

  /// Specifies the date and time when the payment schedule is due. This field must be provided for fixed type payment terms.
  public var dueAt: Swift.Optional<String?> {
    get {
      return graphQLMap["dueAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "dueAt")
    }
  }
}

/// The input fields for a purchasing entity. Can either be a customer or a purchasing company.
public struct PurchasingEntityInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - customerId: Represents a customer. Null if there is a purchasing company.
  ///   - purchasingCompany: Represents a purchasing company. Null if there is a customer.
  public init(customerId: Swift.Optional<GraphQLID?> = nil, purchasingCompany: Swift.Optional<PurchasingCompanyInput?> = nil) {
    graphQLMap = ["customerId": customerId, "purchasingCompany": purchasingCompany]
  }

  /// Represents a customer. Null if there is a purchasing company.
  public var customerId: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["customerId"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "customerId")
    }
  }

  /// Represents a purchasing company. Null if there is a customer.
  public var purchasingCompany: Swift.Optional<PurchasingCompanyInput?> {
    get {
      return graphQLMap["purchasingCompany"] as? Swift.Optional<PurchasingCompanyInput?> ?? Swift.Optional<PurchasingCompanyInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "purchasingCompany")
    }
  }
}

/// The input fields for a purchasing company, which is a combination of company, company contact, and company location.
public struct PurchasingCompanyInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - companyId: ID of the company.
  ///   - companyContactId: ID of the company contact.
  ///   - companyLocationId: ID of the company location.
  public init(companyId: GraphQLID, companyContactId: GraphQLID, companyLocationId: GraphQLID) {
    graphQLMap = ["companyId": companyId, "companyContactId": companyContactId, "companyLocationId": companyLocationId]
  }

  /// ID of the company.
  public var companyId: GraphQLID {
    get {
      return graphQLMap["companyId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "companyId")
    }
  }

  /// ID of the company contact.
  public var companyContactId: GraphQLID {
    get {
      return graphQLMap["companyContactId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "companyContactId")
    }
  }

  /// ID of the company location.
  public var companyLocationId: GraphQLID {
    get {
      return graphQLMap["companyLocationId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "companyLocationId")
    }
  }
}

/// The input fields to specify the draft order to delete by its ID.
public struct DraftOrderDeleteInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id: The ID of the draft order to delete.
  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  /// The ID of the draft order to delete.
  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public final class GetAllDiicountCodesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllDiicountCodes($first: Int) {
      codeDiscountNodes(first: $first) {
        __typename
        nodes {
          __typename
          id
          codeDiscount {
            __typename
            ... on DiscountCodeBasic {
              __typename
              title
              summary
              codeCount
              usageLimit
              status
              customerGets {
                __typename
                items {
                  __typename
                }
                value {
                  __typename
                }
              }
              codes(first: $first) {
                __typename
                nodes {
                  __typename
                  code
                  id
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "getAllDiicountCodes"

  public var first: Int?

  public init(first: Int? = nil) {
    self.first = first
  }

  public var variables: GraphQLMap? {
    return ["first": first]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["QueryRoot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("codeDiscountNodes", arguments: ["first": GraphQLVariable("first")], type: .nonNull(.object(CodeDiscountNode.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(codeDiscountNodes: CodeDiscountNode) {
      self.init(unsafeResultMap: ["__typename": "QueryRoot", "codeDiscountNodes": codeDiscountNodes.resultMap])
    }

    /// List of code discounts. Special fields for query params:
    /// * status: active, expired, scheduled
    /// * discount_type: bogo, fixed_amount, free_shipping, percentage.
    public var codeDiscountNodes: CodeDiscountNode {
      get {
        return CodeDiscountNode(unsafeResultMap: resultMap["codeDiscountNodes"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "codeDiscountNodes")
      }
    }

    public struct CodeDiscountNode: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DiscountCodeNodeConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node]) {
        self.init(unsafeResultMap: ["__typename": "DiscountCodeNodeConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of the nodes contained in DiscountCodeNodeEdge.
      public var nodes: [Node] {
        get {
          return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DiscountCodeNode"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("codeDiscount", type: .nonNull(.object(CodeDiscount.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, codeDiscount: CodeDiscount) {
          self.init(unsafeResultMap: ["__typename": "DiscountCodeNode", "id": id, "codeDiscount": codeDiscount.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A globally-unique ID.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The underlying code discount object.
        public var codeDiscount: CodeDiscount {
          get {
            return CodeDiscount(unsafeResultMap: resultMap["codeDiscount"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "codeDiscount")
          }
        }

        public struct CodeDiscount: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["DiscountCodeApp", "DiscountCodeBasic", "DiscountCodeBxgy", "DiscountCodeFreeShipping"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLTypeCase(
                variants: ["DiscountCodeBasic": AsDiscountCodeBasic.selections],
                default: [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                ]
              )
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeDiscountCodeApp() -> CodeDiscount {
            return CodeDiscount(unsafeResultMap: ["__typename": "DiscountCodeApp"])
          }

          public static func makeDiscountCodeBxgy() -> CodeDiscount {
            return CodeDiscount(unsafeResultMap: ["__typename": "DiscountCodeBxgy"])
          }

          public static func makeDiscountCodeFreeShipping() -> CodeDiscount {
            return CodeDiscount(unsafeResultMap: ["__typename": "DiscountCodeFreeShipping"])
          }

          public static func makeDiscountCodeBasic(title: String, summary: String, codeCount: Int, usageLimit: Int? = nil, status: DiscountStatus, customerGets: AsDiscountCodeBasic.CustomerGet, codes: AsDiscountCodeBasic.Code) -> CodeDiscount {
            return CodeDiscount(unsafeResultMap: ["__typename": "DiscountCodeBasic", "title": title, "summary": summary, "codeCount": codeCount, "usageLimit": usageLimit, "status": status, "customerGets": customerGets.resultMap, "codes": codes.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var asDiscountCodeBasic: AsDiscountCodeBasic? {
            get {
              if !AsDiscountCodeBasic.possibleTypes.contains(__typename) { return nil }
              return AsDiscountCodeBasic(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap = newValue.resultMap
            }
          }

          public struct AsDiscountCodeBasic: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["DiscountCodeBasic"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("summary", type: .nonNull(.scalar(String.self))),
                GraphQLField("codeCount", type: .nonNull(.scalar(Int.self))),
                GraphQLField("usageLimit", type: .scalar(Int.self)),
                GraphQLField("status", type: .nonNull(.scalar(DiscountStatus.self))),
                GraphQLField("customerGets", type: .nonNull(.object(CustomerGet.selections))),
                GraphQLField("codes", arguments: ["first": GraphQLVariable("first")], type: .nonNull(.object(Code.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: String, summary: String, codeCount: Int, usageLimit: Int? = nil, status: DiscountStatus, customerGets: CustomerGet, codes: Code) {
              self.init(unsafeResultMap: ["__typename": "DiscountCodeBasic", "title": title, "summary": summary, "codeCount": codeCount, "usageLimit": usageLimit, "status": status, "customerGets": customerGets.resultMap, "codes": codes.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The title of the discount.
            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            /// A detailed summary of the discount.
            public var summary: String {
              get {
                return resultMap["summary"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "summary")
              }
            }

            /// The number of redeem codes for the discount.
            public var codeCount: Int {
              get {
                return resultMap["codeCount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "codeCount")
              }
            }

            /// The maximum number of times that the discount can be used.
            public var usageLimit: Int? {
              get {
                return resultMap["usageLimit"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "usageLimit")
              }
            }

            /// The status of the discount.
            public var status: DiscountStatus {
              get {
                return resultMap["status"]! as! DiscountStatus
              }
              set {
                resultMap.updateValue(newValue, forKey: "status")
              }
            }

            /// The qualifying items in an order, the quantity of each one, and the total value of the discount.
            public var customerGets: CustomerGet {
              get {
                return CustomerGet(unsafeResultMap: resultMap["customerGets"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "customerGets")
              }
            }

            /// A list of redeem codes for the discount.
            public var codes: Code {
              get {
                return Code(unsafeResultMap: resultMap["codes"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "codes")
              }
            }

            public struct CustomerGet: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["DiscountCustomerGets"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("items", type: .nonNull(.object(Item.selections))),
                  GraphQLField("value", type: .nonNull(.object(Value.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(items: Item, value: Value) {
                self.init(unsafeResultMap: ["__typename": "DiscountCustomerGets", "items": items.resultMap, "value": value.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The items to which the discount applies.
              public var items: Item {
                get {
                  return Item(unsafeResultMap: resultMap["items"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "items")
                }
              }

              /// Entitled quantity and the discount value.
              public var value: Value {
                get {
                  return Value(unsafeResultMap: resultMap["value"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "value")
                }
              }

              public struct Item: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["AllDiscountItems", "DiscountCollections", "DiscountProducts"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeAllDiscountItems() -> Item {
                  return Item(unsafeResultMap: ["__typename": "AllDiscountItems"])
                }

                public static func makeDiscountCollections() -> Item {
                  return Item(unsafeResultMap: ["__typename": "DiscountCollections"])
                }

                public static func makeDiscountProducts() -> Item {
                  return Item(unsafeResultMap: ["__typename": "DiscountProducts"])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }
              }

              public struct Value: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["DiscountAmount", "DiscountOnQuantity", "DiscountPercentage"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeDiscountAmount() -> Value {
                  return Value(unsafeResultMap: ["__typename": "DiscountAmount"])
                }

                public static func makeDiscountOnQuantity() -> Value {
                  return Value(unsafeResultMap: ["__typename": "DiscountOnQuantity"])
                }

                public static func makeDiscountPercentage() -> Value {
                  return Value(unsafeResultMap: ["__typename": "DiscountPercentage"])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }
              }
            }

            public struct Code: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["DiscountRedeemCodeConnection"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(nodes: [Node]) {
                self.init(unsafeResultMap: ["__typename": "DiscountRedeemCodeConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A list of the nodes contained in DiscountRedeemCodeEdge.
              public var nodes: [Node] {
                get {
                  return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
                }
                set {
                  resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["DiscountRedeemCode"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("code", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(code: String, id: GraphQLID) {
                  self.init(unsafeResultMap: ["__typename": "DiscountRedeemCode", "code": code, "id": id])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The code that a customer can use at checkout to receive a discount.
                public var code: String {
                  get {
                    return resultMap["code"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "code")
                  }
                }

                /// A globally-unique ID of the discount redeem code.
                public var id: GraphQLID {
                  get {
                    return resultMap["id"]! as! GraphQLID
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class DiscountCodeBasicCreateForSpecificUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation discountCodeBasicCreateForSpecificUser($basicCodeDiscount: DiscountCodeBasicInput!) {
      discountCodeBasicCreate(basicCodeDiscount: $basicCodeDiscount) {
        __typename
        codeDiscountNode {
          __typename
          id
        }
        userErrors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName: String = "discountCodeBasicCreateForSpecificUser"

  public var basicCodeDiscount: DiscountCodeBasicInput

  public init(basicCodeDiscount: DiscountCodeBasicInput) {
    self.basicCodeDiscount = basicCodeDiscount
  }

  public var variables: GraphQLMap? {
    return ["basicCodeDiscount": basicCodeDiscount]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("discountCodeBasicCreate", arguments: ["basicCodeDiscount": GraphQLVariable("basicCodeDiscount")], type: .object(DiscountCodeBasicCreate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(discountCodeBasicCreate: DiscountCodeBasicCreate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "discountCodeBasicCreate": discountCodeBasicCreate.flatMap { (value: DiscountCodeBasicCreate) -> ResultMap in value.resultMap }])
    }

    /// Creates a basic code discount.
    public var discountCodeBasicCreate: DiscountCodeBasicCreate? {
      get {
        return (resultMap["discountCodeBasicCreate"] as? ResultMap).flatMap { DiscountCodeBasicCreate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "discountCodeBasicCreate")
      }
    }

    public struct DiscountCodeBasicCreate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DiscountCodeBasicCreatePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("codeDiscountNode", type: .object(CodeDiscountNode.selections)),
          GraphQLField("userErrors", type: .nonNull(.list(.nonNull(.object(UserError.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(codeDiscountNode: CodeDiscountNode? = nil, userErrors: [UserError]) {
        self.init(unsafeResultMap: ["__typename": "DiscountCodeBasicCreatePayload", "codeDiscountNode": codeDiscountNode.flatMap { (value: CodeDiscountNode) -> ResultMap in value.resultMap }, "userErrors": userErrors.map { (value: UserError) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The created code discount.
      public var codeDiscountNode: CodeDiscountNode? {
        get {
          return (resultMap["codeDiscountNode"] as? ResultMap).flatMap { CodeDiscountNode(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "codeDiscountNode")
        }
      }

      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] {
        get {
          return (resultMap["userErrors"] as! [ResultMap]).map { (value: ResultMap) -> UserError in UserError(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: UserError) -> ResultMap in value.resultMap }, forKey: "userErrors")
        }
      }

      public struct CodeDiscountNode: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DiscountCodeNode"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "DiscountCodeNode", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A globally-unique ID.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }

      public struct UserError: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DiscountUserError"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("field", type: .list(.nonNull(.scalar(String.self)))),
            GraphQLField("message", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: [String]? = nil, message: String) {
          self.init(unsafeResultMap: ["__typename": "DiscountUserError", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The path to the input field that caused the error.
        public var field: [String]? {
          get {
            return resultMap["field"] as? [String]
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class DraftOrderCreateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation draftOrderCreate($input: DraftOrderInput!) {
      draftOrderCreate(input: $input) {
        __typename
        draftOrder {
          __typename
          id
          name
          email
          subtotalPrice
          note2
          totalPrice
          lineItems(first: 100) {
            __typename
            nodes {
              __typename
              quantity
              variant {
                __typename
                id
                price
                availableForSale
                title
              }
              product {
                __typename
                id
                priceRangeV2 {
                  __typename
                  maxVariantPrice {
                    __typename
                    amount
                    currencyCode
                  }
                }
                title
                productType
                featuredImage {
                  __typename
                  url
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "draftOrderCreate"

  public var input: DraftOrderInput

  public init(input: DraftOrderInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("draftOrderCreate", arguments: ["input": GraphQLVariable("input")], type: .object(DraftOrderCreate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(draftOrderCreate: DraftOrderCreate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "draftOrderCreate": draftOrderCreate.flatMap { (value: DraftOrderCreate) -> ResultMap in value.resultMap }])
    }

    /// Creates a draft order.
    public var draftOrderCreate: DraftOrderCreate? {
      get {
        return (resultMap["draftOrderCreate"] as? ResultMap).flatMap { DraftOrderCreate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "draftOrderCreate")
      }
    }

    public struct DraftOrderCreate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DraftOrderCreatePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("draftOrder", type: .object(DraftOrder.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(draftOrder: DraftOrder? = nil) {
        self.init(unsafeResultMap: ["__typename": "DraftOrderCreatePayload", "draftOrder": draftOrder.flatMap { (value: DraftOrder) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The created draft order.
      public var draftOrder: DraftOrder? {
        get {
          return (resultMap["draftOrder"] as? ResultMap).flatMap { DraftOrder(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "draftOrder")
        }
      }

      public struct DraftOrder: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DraftOrder"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("subtotalPrice", type: .nonNull(.scalar(String.self))),
            GraphQLField("note2", type: .scalar(String.self)),
            GraphQLField("totalPrice", type: .nonNull(.scalar(String.self))),
            GraphQLField("lineItems", arguments: ["first": 100], type: .nonNull(.object(LineItem.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, email: String? = nil, subtotalPrice: String, note2: String? = nil, totalPrice: String, lineItems: LineItem) {
          self.init(unsafeResultMap: ["__typename": "DraftOrder", "id": id, "name": name, "email": email, "subtotalPrice": subtotalPrice, "note2": note2, "totalPrice": totalPrice, "lineItems": lineItems.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A globally-unique ID.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The identifier for the draft order, which is unique within the store. For example, _#D1223_.
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The email address of the customer, which is used to send notifications.
        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        /// The subtotal of the line items and their discounts. The subtotal doesn't include shipping charges, shipping discounts, or taxes.
        public var subtotalPrice: String {
          get {
            return resultMap["subtotalPrice"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subtotalPrice")
          }
        }

        /// The text from an optional note attached to the draft order.
        public var note2: String? {
          get {
            return resultMap["note2"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "note2")
          }
        }

        /// The total amount of the draft order, including taxes, shipping charges, and discounts.
        public var totalPrice: String {
          get {
            return resultMap["totalPrice"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalPrice")
          }
        }

        /// The list of the line items in the draft order.
        public var lineItems: LineItem {
          get {
            return LineItem(unsafeResultMap: resultMap["lineItems"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "lineItems")
          }
        }

        public struct LineItem: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["DraftOrderLineItemConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nodes: [Node]) {
            self.init(unsafeResultMap: ["__typename": "DraftOrderLineItemConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of the nodes contained in DraftOrderLineItemEdge.
          public var nodes: [Node] {
            get {
              return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["DraftOrderLineItem"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
                GraphQLField("variant", type: .object(Variant.selections)),
                GraphQLField("product", type: .object(Product.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(quantity: Int, variant: Variant? = nil, product: Product? = nil) {
              self.init(unsafeResultMap: ["__typename": "DraftOrderLineItem", "quantity": quantity, "variant": variant.flatMap { (value: Variant) -> ResultMap in value.resultMap }, "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The number of product variants that are requested in the draft order.
            public var quantity: Int {
              get {
                return resultMap["quantity"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "quantity")
              }
            }

            /// The associated variant for the line item.
            public var variant: Variant? {
              get {
                return (resultMap["variant"] as? ResultMap).flatMap { Variant(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "variant")
              }
            }

            /// The product corresponding to the line item’s product variant.
            public var product: Product? {
              get {
                return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "product")
              }
            }

            public struct Variant: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ProductVariant"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("price", type: .nonNull(.scalar(String.self))),
                  GraphQLField("availableForSale", type: .nonNull(.scalar(Bool.self))),
                  GraphQLField("title", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, price: String, availableForSale: Bool, title: String) {
                self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "price": price, "availableForSale": availableForSale, "title": title])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A globally-unique ID.
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The price of the product variant in the default shop currency.
              public var price: String {
                get {
                  return resultMap["price"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "price")
                }
              }

              /// Whether the product variant is available for sale.
              public var availableForSale: Bool {
                get {
                  return resultMap["availableForSale"]! as! Bool
                }
                set {
                  resultMap.updateValue(newValue, forKey: "availableForSale")
                }
              }

              /// The title of the product variant.
              public var title: String {
                get {
                  return resultMap["title"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "title")
                }
              }
            }

            public struct Product: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Product"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("priceRangeV2", type: .nonNull(.object(PriceRangeV2.selections))),
                  GraphQLField("title", type: .nonNull(.scalar(String.self))),
                  GraphQLField("productType", type: .nonNull(.scalar(String.self))),
                  GraphQLField("featuredImage", type: .object(FeaturedImage.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, priceRangeV2: PriceRangeV2, title: String, productType: String, featuredImage: FeaturedImage? = nil) {
                self.init(unsafeResultMap: ["__typename": "Product", "id": id, "priceRangeV2": priceRangeV2.resultMap, "title": title, "productType": productType, "featuredImage": featuredImage.flatMap { (value: FeaturedImage) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A globally-unique ID.
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The price range of the product with prices formatted as decimals.
              public var priceRangeV2: PriceRangeV2 {
                get {
                  return PriceRangeV2(unsafeResultMap: resultMap["priceRangeV2"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "priceRangeV2")
                }
              }

              /// The title of the product.
              public var title: String {
                get {
                  return resultMap["title"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "title")
                }
              }

              /// The product type specified by the merchant.
              public var productType: String {
                get {
                  return resultMap["productType"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "productType")
                }
              }

              /// The featured image for the product.
              public var featuredImage: FeaturedImage? {
                get {
                  return (resultMap["featuredImage"] as? ResultMap).flatMap { FeaturedImage(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "featuredImage")
                }
              }

              public struct PriceRangeV2: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["ProductPriceRangeV2"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("maxVariantPrice", type: .nonNull(.object(MaxVariantPrice.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(maxVariantPrice: MaxVariantPrice) {
                  self.init(unsafeResultMap: ["__typename": "ProductPriceRangeV2", "maxVariantPrice": maxVariantPrice.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The highest variant's price.
                public var maxVariantPrice: MaxVariantPrice {
                  get {
                    return MaxVariantPrice(unsafeResultMap: resultMap["maxVariantPrice"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "maxVariantPrice")
                  }
                }

                public struct MaxVariantPrice: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["MoneyV2"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("amount", type: .nonNull(.scalar(String.self))),
                      GraphQLField("currencyCode", type: .nonNull(.scalar(CurrencyCode.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(amount: String, currencyCode: CurrencyCode) {
                    self.init(unsafeResultMap: ["__typename": "MoneyV2", "amount": amount, "currencyCode": currencyCode])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Decimal money amount.
                  public var amount: String {
                    get {
                      return resultMap["amount"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "amount")
                    }
                  }

                  /// Currency of the money.
                  public var currencyCode: CurrencyCode {
                    get {
                      return resultMap["currencyCode"]! as! CurrencyCode
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "currencyCode")
                    }
                  }
                }
              }

              public struct FeaturedImage: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Image"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(url: String) {
                  self.init(unsafeResultMap: ["__typename": "Image", "url": url])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The location of the image as a URL.
                /// 
                /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                /// 
                /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                /// 
                /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                public var url: String {
                  get {
                    return resultMap["url"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "url")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class DraftOrderUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation draftOrderUpdate($id: ID!, $input: DraftOrderInput!) {
      draftOrderUpdate(id: $id, input: $input) {
        __typename
        draftOrder {
          __typename
          id
          name
          email
          subtotalPrice
          note2
          totalPrice
          lineItems(first: 100) {
            __typename
            nodes {
              __typename
              quantity
              variant {
                __typename
                id
                price
                availableForSale
                title
              }
              product {
                __typename
                id
                priceRangeV2 {
                  __typename
                  maxVariantPrice {
                    __typename
                    amount
                    currencyCode
                  }
                }
                title
                productType
                featuredImage {
                  __typename
                  url
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "draftOrderUpdate"

  public var id: GraphQLID
  public var input: DraftOrderInput

  public init(id: GraphQLID, input: DraftOrderInput) {
    self.id = id
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["id": id, "input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("draftOrderUpdate", arguments: ["id": GraphQLVariable("id"), "input": GraphQLVariable("input")], type: .object(DraftOrderUpdate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(draftOrderUpdate: DraftOrderUpdate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "draftOrderUpdate": draftOrderUpdate.flatMap { (value: DraftOrderUpdate) -> ResultMap in value.resultMap }])
    }

    /// Updates a draft order.
    /// 
    /// If a checkout has been started for a draft order, any update to the draft will unlink the checkout. Checkouts
    /// are created but not immediately completed when opening the merchant credit card modal in the admin, and when a
    /// buyer opens the invoice URL. This is usually fine, but there is an edge case where a checkout is in progress
    /// and the draft is updated before the checkout completes. This will not interfere with the checkout and order
    /// creation, but if the link from draft to checkout is broken the draft will remain open even after the order is
    /// created.
    public var draftOrderUpdate: DraftOrderUpdate? {
      get {
        return (resultMap["draftOrderUpdate"] as? ResultMap).flatMap { DraftOrderUpdate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "draftOrderUpdate")
      }
    }

    public struct DraftOrderUpdate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DraftOrderUpdatePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("draftOrder", type: .object(DraftOrder.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(draftOrder: DraftOrder? = nil) {
        self.init(unsafeResultMap: ["__typename": "DraftOrderUpdatePayload", "draftOrder": draftOrder.flatMap { (value: DraftOrder) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The updated draft order.
      public var draftOrder: DraftOrder? {
        get {
          return (resultMap["draftOrder"] as? ResultMap).flatMap { DraftOrder(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "draftOrder")
        }
      }

      public struct DraftOrder: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DraftOrder"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("subtotalPrice", type: .nonNull(.scalar(String.self))),
            GraphQLField("note2", type: .scalar(String.self)),
            GraphQLField("totalPrice", type: .nonNull(.scalar(String.self))),
            GraphQLField("lineItems", arguments: ["first": 100], type: .nonNull(.object(LineItem.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, email: String? = nil, subtotalPrice: String, note2: String? = nil, totalPrice: String, lineItems: LineItem) {
          self.init(unsafeResultMap: ["__typename": "DraftOrder", "id": id, "name": name, "email": email, "subtotalPrice": subtotalPrice, "note2": note2, "totalPrice": totalPrice, "lineItems": lineItems.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A globally-unique ID.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The identifier for the draft order, which is unique within the store. For example, _#D1223_.
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The email address of the customer, which is used to send notifications.
        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        /// The subtotal of the line items and their discounts. The subtotal doesn't include shipping charges, shipping discounts, or taxes.
        public var subtotalPrice: String {
          get {
            return resultMap["subtotalPrice"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subtotalPrice")
          }
        }

        /// The text from an optional note attached to the draft order.
        public var note2: String? {
          get {
            return resultMap["note2"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "note2")
          }
        }

        /// The total amount of the draft order, including taxes, shipping charges, and discounts.
        public var totalPrice: String {
          get {
            return resultMap["totalPrice"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalPrice")
          }
        }

        /// The list of the line items in the draft order.
        public var lineItems: LineItem {
          get {
            return LineItem(unsafeResultMap: resultMap["lineItems"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "lineItems")
          }
        }

        public struct LineItem: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["DraftOrderLineItemConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nodes: [Node]) {
            self.init(unsafeResultMap: ["__typename": "DraftOrderLineItemConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of the nodes contained in DraftOrderLineItemEdge.
          public var nodes: [Node] {
            get {
              return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["DraftOrderLineItem"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
                GraphQLField("variant", type: .object(Variant.selections)),
                GraphQLField("product", type: .object(Product.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(quantity: Int, variant: Variant? = nil, product: Product? = nil) {
              self.init(unsafeResultMap: ["__typename": "DraftOrderLineItem", "quantity": quantity, "variant": variant.flatMap { (value: Variant) -> ResultMap in value.resultMap }, "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The number of product variants that are requested in the draft order.
            public var quantity: Int {
              get {
                return resultMap["quantity"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "quantity")
              }
            }

            /// The associated variant for the line item.
            public var variant: Variant? {
              get {
                return (resultMap["variant"] as? ResultMap).flatMap { Variant(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "variant")
              }
            }

            /// The product corresponding to the line item’s product variant.
            public var product: Product? {
              get {
                return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "product")
              }
            }

            public struct Variant: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ProductVariant"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("price", type: .nonNull(.scalar(String.self))),
                  GraphQLField("availableForSale", type: .nonNull(.scalar(Bool.self))),
                  GraphQLField("title", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, price: String, availableForSale: Bool, title: String) {
                self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "price": price, "availableForSale": availableForSale, "title": title])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A globally-unique ID.
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The price of the product variant in the default shop currency.
              public var price: String {
                get {
                  return resultMap["price"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "price")
                }
              }

              /// Whether the product variant is available for sale.
              public var availableForSale: Bool {
                get {
                  return resultMap["availableForSale"]! as! Bool
                }
                set {
                  resultMap.updateValue(newValue, forKey: "availableForSale")
                }
              }

              /// The title of the product variant.
              public var title: String {
                get {
                  return resultMap["title"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "title")
                }
              }
            }

            public struct Product: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Product"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("priceRangeV2", type: .nonNull(.object(PriceRangeV2.selections))),
                  GraphQLField("title", type: .nonNull(.scalar(String.self))),
                  GraphQLField("productType", type: .nonNull(.scalar(String.self))),
                  GraphQLField("featuredImage", type: .object(FeaturedImage.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, priceRangeV2: PriceRangeV2, title: String, productType: String, featuredImage: FeaturedImage? = nil) {
                self.init(unsafeResultMap: ["__typename": "Product", "id": id, "priceRangeV2": priceRangeV2.resultMap, "title": title, "productType": productType, "featuredImage": featuredImage.flatMap { (value: FeaturedImage) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A globally-unique ID.
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The price range of the product with prices formatted as decimals.
              public var priceRangeV2: PriceRangeV2 {
                get {
                  return PriceRangeV2(unsafeResultMap: resultMap["priceRangeV2"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "priceRangeV2")
                }
              }

              /// The title of the product.
              public var title: String {
                get {
                  return resultMap["title"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "title")
                }
              }

              /// The product type specified by the merchant.
              public var productType: String {
                get {
                  return resultMap["productType"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "productType")
                }
              }

              /// The featured image for the product.
              public var featuredImage: FeaturedImage? {
                get {
                  return (resultMap["featuredImage"] as? ResultMap).flatMap { FeaturedImage(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "featuredImage")
                }
              }

              public struct PriceRangeV2: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["ProductPriceRangeV2"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("maxVariantPrice", type: .nonNull(.object(MaxVariantPrice.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(maxVariantPrice: MaxVariantPrice) {
                  self.init(unsafeResultMap: ["__typename": "ProductPriceRangeV2", "maxVariantPrice": maxVariantPrice.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The highest variant's price.
                public var maxVariantPrice: MaxVariantPrice {
                  get {
                    return MaxVariantPrice(unsafeResultMap: resultMap["maxVariantPrice"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "maxVariantPrice")
                  }
                }

                public struct MaxVariantPrice: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["MoneyV2"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("amount", type: .nonNull(.scalar(String.self))),
                      GraphQLField("currencyCode", type: .nonNull(.scalar(CurrencyCode.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(amount: String, currencyCode: CurrencyCode) {
                    self.init(unsafeResultMap: ["__typename": "MoneyV2", "amount": amount, "currencyCode": currencyCode])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Decimal money amount.
                  public var amount: String {
                    get {
                      return resultMap["amount"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "amount")
                    }
                  }

                  /// Currency of the money.
                  public var currencyCode: CurrencyCode {
                    get {
                      return resultMap["currencyCode"]! as! CurrencyCode
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "currencyCode")
                    }
                  }
                }
              }

              public struct FeaturedImage: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Image"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(url: String) {
                  self.init(unsafeResultMap: ["__typename": "Image", "url": url])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The location of the image as a URL.
                /// 
                /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                /// 
                /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                /// 
                /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                public var url: String {
                  get {
                    return resultMap["url"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "url")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class DraftOrderQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query draftOrder($id: ID!) {
      draftOrder(id: $id) {
        __typename
        id
        name
        email
        subtotalPrice
        note2
        totalPrice
        lineItems(first: 100) {
          __typename
          nodes {
            __typename
            quantity
            variant {
              __typename
              id
              price
              availableForSale
              title
            }
            product {
              __typename
              id
              priceRangeV2 {
                __typename
                maxVariantPrice {
                  __typename
                  amount
                  currencyCode
                }
              }
              title
              productType
              featuredImage {
                __typename
                url
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "draftOrder"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["QueryRoot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("draftOrder", arguments: ["id": GraphQLVariable("id")], type: .object(DraftOrder.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(draftOrder: DraftOrder? = nil) {
      self.init(unsafeResultMap: ["__typename": "QueryRoot", "draftOrder": draftOrder.flatMap { (value: DraftOrder) -> ResultMap in value.resultMap }])
    }

    /// Returns a DraftOrder resource by ID.
    public var draftOrder: DraftOrder? {
      get {
        return (resultMap["draftOrder"] as? ResultMap).flatMap { DraftOrder(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "draftOrder")
      }
    }

    public struct DraftOrder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DraftOrder"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("subtotalPrice", type: .nonNull(.scalar(String.self))),
          GraphQLField("note2", type: .scalar(String.self)),
          GraphQLField("totalPrice", type: .nonNull(.scalar(String.self))),
          GraphQLField("lineItems", arguments: ["first": 100], type: .nonNull(.object(LineItem.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, email: String? = nil, subtotalPrice: String, note2: String? = nil, totalPrice: String, lineItems: LineItem) {
        self.init(unsafeResultMap: ["__typename": "DraftOrder", "id": id, "name": name, "email": email, "subtotalPrice": subtotalPrice, "note2": note2, "totalPrice": totalPrice, "lineItems": lineItems.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A globally-unique ID.
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The identifier for the draft order, which is unique within the store. For example, _#D1223_.
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The email address of the customer, which is used to send notifications.
      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      /// The subtotal of the line items and their discounts. The subtotal doesn't include shipping charges, shipping discounts, or taxes.
      public var subtotalPrice: String {
        get {
          return resultMap["subtotalPrice"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subtotalPrice")
        }
      }

      /// The text from an optional note attached to the draft order.
      public var note2: String? {
        get {
          return resultMap["note2"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "note2")
        }
      }

      /// The total amount of the draft order, including taxes, shipping charges, and discounts.
      public var totalPrice: String {
        get {
          return resultMap["totalPrice"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalPrice")
        }
      }

      /// The list of the line items in the draft order.
      public var lineItems: LineItem {
        get {
          return LineItem(unsafeResultMap: resultMap["lineItems"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "lineItems")
        }
      }

      public struct LineItem: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DraftOrderLineItemConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node]) {
          self.init(unsafeResultMap: ["__typename": "DraftOrderLineItemConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of the nodes contained in DraftOrderLineItemEdge.
        public var nodes: [Node] {
          get {
            return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["DraftOrderLineItem"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
              GraphQLField("variant", type: .object(Variant.selections)),
              GraphQLField("product", type: .object(Product.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(quantity: Int, variant: Variant? = nil, product: Product? = nil) {
            self.init(unsafeResultMap: ["__typename": "DraftOrderLineItem", "quantity": quantity, "variant": variant.flatMap { (value: Variant) -> ResultMap in value.resultMap }, "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The number of product variants that are requested in the draft order.
          public var quantity: Int {
            get {
              return resultMap["quantity"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "quantity")
            }
          }

          /// The associated variant for the line item.
          public var variant: Variant? {
            get {
              return (resultMap["variant"] as? ResultMap).flatMap { Variant(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "variant")
            }
          }

          /// The product corresponding to the line item’s product variant.
          public var product: Product? {
            get {
              return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "product")
            }
          }

          public struct Variant: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProductVariant"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("price", type: .nonNull(.scalar(String.self))),
                GraphQLField("availableForSale", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, price: String, availableForSale: Bool, title: String) {
              self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "price": price, "availableForSale": availableForSale, "title": title])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A globally-unique ID.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The price of the product variant in the default shop currency.
            public var price: String {
              get {
                return resultMap["price"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "price")
              }
            }

            /// Whether the product variant is available for sale.
            public var availableForSale: Bool {
              get {
                return resultMap["availableForSale"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "availableForSale")
              }
            }

            /// The title of the product variant.
            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }
          }

          public struct Product: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Product"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("priceRangeV2", type: .nonNull(.object(PriceRangeV2.selections))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("productType", type: .nonNull(.scalar(String.self))),
                GraphQLField("featuredImage", type: .object(FeaturedImage.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, priceRangeV2: PriceRangeV2, title: String, productType: String, featuredImage: FeaturedImage? = nil) {
              self.init(unsafeResultMap: ["__typename": "Product", "id": id, "priceRangeV2": priceRangeV2.resultMap, "title": title, "productType": productType, "featuredImage": featuredImage.flatMap { (value: FeaturedImage) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A globally-unique ID.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The price range of the product with prices formatted as decimals.
            public var priceRangeV2: PriceRangeV2 {
              get {
                return PriceRangeV2(unsafeResultMap: resultMap["priceRangeV2"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "priceRangeV2")
              }
            }

            /// The title of the product.
            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            /// The product type specified by the merchant.
            public var productType: String {
              get {
                return resultMap["productType"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "productType")
              }
            }

            /// The featured image for the product.
            public var featuredImage: FeaturedImage? {
              get {
                return (resultMap["featuredImage"] as? ResultMap).flatMap { FeaturedImage(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "featuredImage")
              }
            }

            public struct PriceRangeV2: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ProductPriceRangeV2"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("maxVariantPrice", type: .nonNull(.object(MaxVariantPrice.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(maxVariantPrice: MaxVariantPrice) {
                self.init(unsafeResultMap: ["__typename": "ProductPriceRangeV2", "maxVariantPrice": maxVariantPrice.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The highest variant's price.
              public var maxVariantPrice: MaxVariantPrice {
                get {
                  return MaxVariantPrice(unsafeResultMap: resultMap["maxVariantPrice"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "maxVariantPrice")
                }
              }

              public struct MaxVariantPrice: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["MoneyV2"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("amount", type: .nonNull(.scalar(String.self))),
                    GraphQLField("currencyCode", type: .nonNull(.scalar(CurrencyCode.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(amount: String, currencyCode: CurrencyCode) {
                  self.init(unsafeResultMap: ["__typename": "MoneyV2", "amount": amount, "currencyCode": currencyCode])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Decimal money amount.
                public var amount: String {
                  get {
                    return resultMap["amount"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "amount")
                  }
                }

                /// Currency of the money.
                public var currencyCode: CurrencyCode {
                  get {
                    return resultMap["currencyCode"]! as! CurrencyCode
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "currencyCode")
                  }
                }
              }
            }

            public struct FeaturedImage: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Image"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String) {
                self.init(unsafeResultMap: ["__typename": "Image", "url": url])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The location of the image as a URL.
              /// 
              /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
              /// 
              /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
              /// 
              /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class DraftOrderDeleteMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation draftOrderDelete($input: DraftOrderDeleteInput!) {
      draftOrderDelete(input: $input) {
        __typename
        deletedId
      }
    }
    """

  public let operationName: String = "draftOrderDelete"

  public var input: DraftOrderDeleteInput

  public init(input: DraftOrderDeleteInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("draftOrderDelete", arguments: ["input": GraphQLVariable("input")], type: .object(DraftOrderDelete.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(draftOrderDelete: DraftOrderDelete? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "draftOrderDelete": draftOrderDelete.flatMap { (value: DraftOrderDelete) -> ResultMap in value.resultMap }])
    }

    /// Deletes a draft order.
    public var draftOrderDelete: DraftOrderDelete? {
      get {
        return (resultMap["draftOrderDelete"] as? ResultMap).flatMap { DraftOrderDelete(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "draftOrderDelete")
      }
    }

    public struct DraftOrderDelete: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DraftOrderDeletePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("deletedId", type: .scalar(GraphQLID.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(deletedId: GraphQLID? = nil) {
        self.init(unsafeResultMap: ["__typename": "DraftOrderDeletePayload", "deletedId": deletedId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the deleted draft order.
      public var deletedId: GraphQLID? {
        get {
          return resultMap["deletedId"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "deletedId")
        }
      }
    }
  }
}
