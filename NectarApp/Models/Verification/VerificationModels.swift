//
//  VerificationModels.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 18.11.2021.
//

import UIKit

struct CodeVerification{
    let code: String
}

class VerificationModels {
    
    private let codeForVerification = CodeVerification.init(code: "5555")
    private let charForRemove: Set<Character> = ["-", "*"]
    
    func checkCodeVerification(_ codeVerifications: String) -> Bool {
        var str = codeVerifications
        str.removeAll(where: { charForRemove.contains($0) } )
        return str == codeVerifications
    }
    
}
