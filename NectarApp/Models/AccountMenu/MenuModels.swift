//
//  MenuModels.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 19.11.2021.
//

import Foundation
import UIKit

struct MenuStruct {
    let icon: UIImage
    let menuName: String
}

class MenuModels {
    let  menuBaseData: [MenuStruct] = [MenuStruct(icon: UIImage(named: "MenuIcon") ?? UIImage(named: "logo3")!, menuName: "Orders"),
                                       MenuStruct(icon: UIImage(named: "My Details") ?? UIImage(named: "logo3")!, menuName: "My Details"),
                                       MenuStruct(icon: UIImage(named: "Delivery Address") ?? UIImage(named: "logo3")!, menuName: "Delivery Address"),
                                       MenuStruct(icon: UIImage(named: "Payment Methods") ?? UIImage(named: "logo3")!, menuName: "Payment Methods"),
                                       MenuStruct(icon: UIImage(named: "Promo Cord") ?? UIImage(named: "logo3")!, menuName: "Promo Cord"),
                                       MenuStruct(icon: UIImage(named: "Notifecations") ?? UIImage(named: "logo3")!, menuName: "Notifecations"),
                                       MenuStruct(icon: UIImage(named: "Help") ?? UIImage(named: "logo3")!, menuName: "Help"),
                                       MenuStruct(icon: UIImage(named: "About") ?? UIImage(named: "logo3")!, menuName: "About")
    ]
    var menuBaseDataGet:[MenuStruct] {
        return menuBaseData
    }
}

