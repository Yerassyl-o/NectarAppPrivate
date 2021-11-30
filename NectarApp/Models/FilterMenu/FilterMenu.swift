//
//  FilterMenu.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 25.11.2021.
//

import Foundation

struct FilterMenuStruct {
    let filterName: String
    let filters: [String]
}

class FilterMenu {
    let filters: [FilterMenuStruct] = [FilterMenuStruct(filterName: "Categories", filters: ["Eggs","Noodles And Pasta", "Chips and Crips", "Fast food"]),
                                       FilterMenuStruct(filterName: "Brand", filters: ["Individual Callection", "Cocola", "Ifrad", "Kazi Farmas"])]
    
    var getFilters: [FilterMenuStruct] {
        return filters
    }
}
