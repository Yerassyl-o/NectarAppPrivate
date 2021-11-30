//
//  search.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 30.11.2021.
//

import Foundation

class SearchProduct {
    
    private var base = ProductDataBase()
    let shared = SearchProduct()
    
    
    func findProduct(productName: String, category: [String], brand: [String]) -> [ProductStruct]{
        var products: [ProductStruct] = []
        var helper: [ProductStruct] = []
        for product in base.getDataBase {
            if product.productName.contains(productName) {
                products.append(product)
            }
        }
        
        for product in products {
            for index in 0 ..< product.category.count {
                for indexY in 0 ..< category.count {
                    if product.category[index] == category[indexY] {
                        helper.append(product)
                    }
                }
            }
        }
        
        products.removeAll()
        products = helper
        
        for product in products {
            for index in 0 ..< product.brand.count {
                for indexY in 0 ..< brand.count {
                    if product.category[index] == brand[indexY] {
                        helper.append(product)
                    }
                }
            }
        }
        
        products.removeAll()
        products = helper
        helper = products
        
        let set: Set<ProductStruct> = Set(helper)
        products = Array(set)
        
        return products
    }
}
