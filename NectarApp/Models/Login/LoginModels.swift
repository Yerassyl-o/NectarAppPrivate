//
//  LoginModels.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 18.11.2021.
//

import Foundation

class LoginModels {
    private let charForRemove: Set<Character> = ["@", "."]
    func checkEmail(_ email: String) -> Bool {
        let count = email.count
        var str = email
        str.removeAll(where: { charForRemove.contains($0) } )
        if str.count == count - 2 {
            return true
        } else {
            return false
        }
    }
}

