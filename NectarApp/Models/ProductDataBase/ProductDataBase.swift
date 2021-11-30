//
//  ProductDataBase.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 21.11.2021.
//

import Foundation
import UIKit

struct ProductStruct {
    let productName: String
    let productUnitOfMeasurement: String
    let productQuantity: Double
    let productPrice: String
    let productCategory: String
    let productReview: Double
    let productImage: UIImage
    let category: [String]
    let brand: String
}

class ProductDataBase {
    let dataBase: [ProductStruct] = [ ProductStruct(productName: "Diet Coke",
                                                    productUnitOfMeasurement: "ml",
                                                    productQuantity: 355,
                                                    productPrice: "1.99",
                                                    productCategory: "Beverages",
                                                    productReview: 4,
                                                    productImage: UIImage(named: "Diet Coke") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
                                      ProductStruct(productName: "Sprite Can",
                                                    productUnitOfMeasurement: "ml",
                                                    productQuantity: 325,
                                                    productPrice: "1.50",
                                                    productCategory: "Beverages",
                                                    productReview: 5,
                                                    productImage: UIImage(named: "Sprite Can") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
                                      ProductStruct(productName: "Apple & Grape Juice",
                                                    productUnitOfMeasurement: "L",
                                                    productQuantity: 2,
                                                    productPrice: "15.99",
                                                    productCategory: "Beverages",
                                                    productReview: 4,
                                                    productImage: UIImage(named: "Apple & Grape Juice") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
                                      ProductStruct(productName: "Orenge Juice",
                                                    productUnitOfMeasurement: "L",
                                                    productQuantity: 2,
                                                    productPrice: "15.99",
                                                    productCategory: "Beverages",
                                                    productReview: 5,
                                                    productImage: UIImage(named: "Orenge Juice") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
                                      ProductStruct(productName: "Coca Cola Can",
                                                    productUnitOfMeasurement: "ml",
                                                    productQuantity: 325,
                                                    productPrice: "4.99",
                                                    productCategory: "Beverages",
                                                    productReview: 5,
                                                    productImage: UIImage(named: "Coca Cola Can") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
                                      ProductStruct(productName: "Pepsi Can",
                                                    productUnitOfMeasurement: "ml",
                                                    productQuantity: 330,
                                                    productPrice: "4.99",
                                                    productCategory: "Beverages",
                                                    productReview: 5,
                                                    productImage: UIImage(named: "Pepsi Can") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
        //        MARK: Dairy & Eggs
                                      ProductStruct(productName: "Egg Chicken Red",
                                                    productUnitOfMeasurement: "pcs",
                                                    productQuantity: 4,
                                                    productPrice: "1.99",
                                                    productCategory: "Dairy & Eggs",
                                                    productReview: 4,
                                                    productImage: UIImage(named: "Egg Chicken Red") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
                                      ProductStruct(productName: "Egg Chicken White",
                                                    productUnitOfMeasurement: "g",
                                                    productQuantity: 180,
                                                    productPrice: "1.50",
                                                    productCategory: "Dairy & Eggs",
                                                    productReview: 4,
                                                    productImage: UIImage(named: "Egg Chicken White") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
        //        MARK: Frash Fruits & Vegetable
                                      ProductStruct(productName: "Red Apple",
                                                    productUnitOfMeasurement: "kg",
                                                    productQuantity: 1,
                                                    productPrice: "4.99",
                                                    productCategory: "Frash Fruits & Vegetable",
                                                    productReview: 5,
                                                    productImage: UIImage(named: "Red Apple") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
                                      ProductStruct(productName: "Bell Pepper Red",
                                                    productUnitOfMeasurement: "pcs",
                                                    productQuantity: 7,
                                                    productPrice: "4.99",
                                                    productCategory: "Frash Fruits & Vegetable",
                                                    productReview: 4,
                                                    productImage: UIImage(named: "Bell Pepper Red") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
                                      ProductStruct(productName: "Ginger",
                                                    productUnitOfMeasurement: "mg",
                                                    productQuantity: 250,
                                                    productPrice: "2.99",
                                                    productCategory: "Frash Fruits & Vegetable",
                                                    productReview: 5,
                                                    productImage: UIImage(named: "Ginger") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
                                      ProductStruct(productName: "Bell Pepper Red",
                                                    productUnitOfMeasurement: "kg",
                                                    productQuantity: 1,
                                                    productPrice: "4.99",
                                                    productCategory: "Frash Fruits & Vegetable",
                                                    productReview: 4,
                                                    productImage: UIImage(named: "Bell Pepper Red") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
        //        MARK: Meat & Fish
                                      ProductStruct(productName: "Beef Bone",
                                                    productUnitOfMeasurement: "kg",
                                                    productQuantity: 1,
                                                    productPrice: "4.99",
                                                    productCategory: "Meat & Fish",
                                                    productReview: 5,
                                                    productImage: UIImage(named: "Beef Bone") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad"),
                                      ProductStruct(productName: "Broiler Chicken",
                                                    productUnitOfMeasurement: "kg",
                                                    productQuantity: 1,
                                                    productPrice: "4.99",
                                                    productCategory: "Meat & Fish",
                                                    productReview: 4,
                                                    productImage: UIImage(named: "Broiler Chicken") ?? UIImage(named:"defaultProductImage")!,
                                                    category: ["Eggs"],
                                                    brand: "Ifrad")
    ]
    
    var getDataBase: [ProductStruct] {
        return dataBase
    }
}
