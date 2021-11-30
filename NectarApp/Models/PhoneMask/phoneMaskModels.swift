//
//  phoneMaskModeks.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 18.11.2021.
//

import UIKit

struct PhoneMask {
    
    let flagOfNation: Character
    let phoneMask: String
    let length: Int
    let stringDividePlace: [Int]
}

class PhoneMaskModel {
    
    let phoneMaskBase: [PhoneMask] = [ PhoneMask(flagOfNation: "🇰🇿", phoneMask: "+77", length: 12, stringDividePlace: [5, 9, 12]),
                                               PhoneMask(flagOfNation: "🇷🇺", phoneMask: "+79", length: 12, stringDividePlace: [5, 9, 12]),
                                               PhoneMask(flagOfNation: "🏴󠁧󠁢󠁥󠁮󠁧󠁿", phoneMask: "+44", length: 13, stringDividePlace: [6,11,14])]
    
    func getPhoneMaskBase() -> [PhoneMask] {
        return self.phoneMaskBase
    }
}
