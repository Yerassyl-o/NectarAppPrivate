//
//  File.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 25.11.2021.
//
//

//import UIKit
//
//
//struct UserCart: Codable {
//    var product: ProductStruct
//    var count: Int
//}
//
//
//class DefaultDataBase {
//
//
//    static let shared = DefaultDataBase()
//    let userDataBaseDefaults = UserDefaults.standard
//
//    var userCarts: [UserCart] {
//
//        get{
//            if let data = userDataBaseDefaults.value(forKey: "userCarts") as? Data{
//                return try! PropertyListDecoder().decode([UserCart].self, from: data)
//            } else{
//                return [UserCart]()
//            }
//        }
//
//        set{
//            if let data = try? PropertyListEncoder().encode(newValue){
//                userDataBaseDefaults.set(data, forKey: "userCarts")
//            }
//        }
//
//    }
//
//    func saveCart(product: ProductStruct, count: Int){
//        let userCart = UserCart(product: product, count: count)
//        userCarts.append(userCart)
//    }
//
//    func removeCart(index: Int) {
//        userCarts.remove(at: index)
//    }
//}
