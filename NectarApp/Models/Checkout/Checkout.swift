//
//  Checkout.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 25.11.2021.
//

import Foundation

struct CheckoutMenuStruct {
    let checkoutMenuName: String
    let checkoutSettingsName: String
}

class CheckoutMenu {
    let checkoutMenu: [CheckoutMenuStruct] = [CheckoutMenuStruct(checkoutMenuName: "Delivery", checkoutSettingsName: "Select Method"),
                                              CheckoutMenuStruct(checkoutMenuName: "Payment", checkoutSettingsName: "💳"),
                                              CheckoutMenuStruct(checkoutMenuName: "Promo Code", checkoutSettingsName: "Pick discount"),
                                              CheckoutMenuStruct(checkoutMenuName: "Total cost", checkoutSettingsName: "$45.57")]
    var getCheckoutMenu: [CheckoutMenuStruct] {
        return checkoutMenu
    }
}
