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
                                              CheckoutMenuStruct(checkoutMenuName: "Delivery", checkoutSettingsName: "💳"),
                                              CheckoutMenuStruct(checkoutMenuName: "Delivery", checkoutSettingsName: "Pick discount"),
                                              CheckoutMenuStruct(checkoutMenuName: "Delivery", checkoutSettingsName: "$45.57")]
    var getCheckoutMenu: [CheckoutMenuStruct] {
        return checkoutMenu
    }
}
