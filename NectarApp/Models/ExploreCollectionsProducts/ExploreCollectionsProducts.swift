//
//  ExploreCollectionsProducts.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 25.11.2021.
//

import Foundation
import UIKit

struct ExploreCollectionsProductsStruct {
    let collectionImage: UIImage
    let collectionName: String
    let collectionBackgroundColor: UIColor
    let borderColor: CGColor
}

class ExploreCollectionsProducts{
    let exploreCollectionsProductsBase: [ExploreCollectionsProductsStruct] = [
        ExploreCollectionsProductsStruct(
            collectionImage: UIImage(named: "Frash Fruits & Vegetable") ?? UIImage(named: "Frash Fruits & Vegetable")!,
            collectionName: "Frash Fruits & Vegetable",
            collectionBackgroundColor: UIColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 0.1),
            borderColor: CGColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 0.7)),
        
        ExploreCollectionsProductsStruct(
            collectionImage: UIImage(named: "Cooking Oil & Ghee") ?? UIImage(named: "Frash Fruits & Vegetable")!,
            collectionName: "Cooking Oil & Ghee",
            collectionBackgroundColor: UIColor(red: 248/255, green: 164/255, blue: 76/255, alpha: 0.1),
            borderColor: CGColor(red: 248/255, green: 164/255, blue: 76/255, alpha: 0.7)),
        
        ExploreCollectionsProductsStruct(
            collectionImage: UIImage(named: "Meat & Fish") ?? UIImage(named: "Frash Fruits & Vegetable")!,
            collectionName: "Meat & Fish",
            collectionBackgroundColor: UIColor(red: 247/255, green: 165/255, blue: 147/255, alpha: 0.25),
            borderColor: CGColor(red: 247/255, green: 165/255, blue: 147/255, alpha: 1)),
        
        ExploreCollectionsProductsStruct(
            collectionImage: UIImage(named: "Bakery & Snacks") ?? UIImage(named: "Frash Fruits & Vegetable")!,
            collectionName: "Bakery & Snacks",
            collectionBackgroundColor: UIColor(red: 211/255, green: 176/255, blue: 224/255, alpha: 0.25),
            borderColor: CGColor(red: 211/255, green: 176/255, blue: 224/255, alpha: 1)),
        
        ExploreCollectionsProductsStruct(
            collectionImage: UIImage(named: "Dairy & Eggs") ?? UIImage(named: "Frash Fruits & Vegetable")!,
            collectionName: "Dairy & Eggs",
            collectionBackgroundColor: UIColor(red: 253/255, green: 229/255, blue: 152/255, alpha: 0.25),
            borderColor: CGColor(red: 253/255, green: 229/255, blue: 152/255, alpha: 1)),
        
        ExploreCollectionsProductsStruct(
            collectionImage: UIImage(named: "Beverages") ?? UIImage(named: "Frash Fruits & Vegetable")!,
            collectionName: "Beverages",
            collectionBackgroundColor: UIColor(red: 183/255, green: 223/255, blue: 245/255, alpha: 0.25),
            borderColor: CGColor(red: 183/255, green: 223/255, blue: 245/255, alpha: 1)),
        ExploreCollectionsProductsStruct(
            collectionImage: UIImage(named: "Frash Fruits & Vegetable") ?? UIImage(named: "Frash Fruits & Vegetable")!,
            collectionName: "Frash Fruits & Vegetable",
            collectionBackgroundColor: UIColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 0.1),
            borderColor: CGColor(red: 83/255, green: 177/255, blue: 117/255, alpha: 0.7)),
        ExploreCollectionsProductsStruct(
            collectionImage: UIImage(named: "Cooking Oil & Ghee") ?? UIImage(named: "Frash Fruits & Vegetable")!,
            collectionName: "Cooking Oil & Ghee",
            collectionBackgroundColor: UIColor(red: 248/255, green: 164/255, blue: 76/255, alpha: 0.1),
            borderColor: CGColor(red: 248/255, green: 164/255, blue: 76/255, alpha: 0.7))
        ]
    var getExploreCollectionsProductsBase: [ExploreCollectionsProductsStruct] {
        return exploreCollectionsProductsBase
    }
}
