//
//  File.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 25.11.2021.
//
//
//
import UIKit


struct UserCart: Codable {
    var productName: String
    var count: Int
}


class DefaultDataBase {


    static let shared = DefaultDataBase()
    let userDataBaseMyCart = UserDefaults.standard
    let userDataBaseFavorurite = UserDefaults.standard
    var userCarts: [UserCart] {

        get{
            if let data = userDataBaseMyCart.value(forKey: "userCarts") as? Data{
                return try! PropertyListDecoder().decode([UserCart].self, from: data)
            } else{
                return [UserCart]()
            }
        }

        set{
            if let data = try? PropertyListEncoder().encode(newValue){
                userDataBaseMyCart.set(data, forKey: "userCarts")
            }
        }

    }
    
    var userFavorurite: [String] {

        get{
            if let data = userDataBaseFavorurite.value(forKey: "userFavorurite") as? Data{
                return try! PropertyListDecoder().decode([String].self, from: data)
            } else{
                return [String]()
            }
        }

        set{
            if let data = try? PropertyListEncoder().encode(newValue){
                userDataBaseFavorurite.set(data, forKey: "userFavorurite")
            }
        }

    }

    func saveMyCart(product: String, count: Int){
        let userCart = UserCart(productName: product, count: count)
        userCarts.append(userCart)
    }

    func removeMyCart(index: Int) {
        userCarts.remove(at: index)
    }
    
    func saveFavurite(product: String){
        userFavorurite.append(product)
    }

    func removeFavorurite(index: Int) {
        userFavorurite.remove(at: index)
    }
    
    func findProducts(name: String) -> ProductStruct {
        let productDataBase = ProductDataBase()
        var returnProduct = productDataBase.getDataBase[0]
        for element in productDataBase.getDataBase {
            if name == element.productName {
                returnProduct = element
            }
        }
        return returnProduct
    }
    
}
