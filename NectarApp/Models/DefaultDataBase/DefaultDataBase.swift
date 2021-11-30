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
    
    // MARK: MyCart methods
    func saveMyCart(product: String, count: Int){
        var logic = false
        let userCartNew = UserCart(productName: product, count: count)
        for index in 0 ..< userCarts.count {
            if userCarts[index].productName == userCartNew.productName {
                logic = true
                userCarts[index].count += count
            }
        }
        
        if logic == false {
            userCarts.append(userCartNew)
        }
    }
    
    func removeMyCart(nameOfProduct: String) {
        var indexOfProduct: Int = 0
        let product = findProducts(name: nameOfProduct)
        for index in 0 ..< userCarts.count {
            if product.productName == userCarts[index].productName {
                indexOfProduct = index
            }
        }
        userCarts.remove(at: indexOfProduct)
    }
    
    func countOfElement(nameOfProduct: String, count: Int) {
        let product = findProducts(name: nameOfProduct)
        
        for index in 0 ..< userCarts.count {
            if userCarts[index].productName == product.productName {
                userCarts[index].count -= count
            }
        }
        
    }
    
    func getCountOfElement(nameOfProduct: String) -> Int{
        var count: Int = 0
        let product = findProducts(name: nameOfProduct)
        
        for index in 0 ..< userCarts.count {
            if userCarts[index].productName == product.productName {
                count =  userCarts[index].count
            }
        }
        return count
    }
    
    func minusCountMyCart(nameOfProduct: String){
        let product = findProducts(name: nameOfProduct)
        
        for index in 0 ..< userCarts.count {
            if userCarts[index].productName == product.productName {
                userCarts[index].count -= 1
            }
        }
    }
    
    func plusCountMyCart(nameOfProduct: String){
        let product = findProducts(name: nameOfProduct)
        
        for index in 0 ..< userCarts.count {
            if userCarts[index].productName == product.productName {
                userCarts[index].count += 1
            }
        }
    }
    
    func getMyCartsCosts() -> Double {
        var cost: Double = 0
        for item in userCarts {
            let product = findProducts(name: item.productName)
            cost += (Double(product.productPrice) ?? 0) * Double(item.count)
        }
        return Double(round((1000 * cost)) / 1000)
    }
    
    func removeAllUserCart() {
        userCarts.removeAll()
    }
    
    // MARK: Favorurite methods
    func saveFavorurite(nameOfproduct: String){
        var repeated = false
        for item in userFavorurite {
            if item == nameOfproduct {
                repeated = true
            }
        }
        if repeated == false {
            userFavorurite.append(nameOfproduct)
        }
       
    }
    
    func removeFavorurite(nameOfproduct: String) {
        var indexOfProduct: Int = 0
        for index in 0 ..< userFavorurite.count {
            if nameOfproduct == userFavorurite[index] {
                indexOfProduct = index
            }
        }
        userFavorurite.remove(at: indexOfProduct)
    }
    
    func checkFavorurite(nameOfproduct: String) -> Bool {
        var isFavorurite = false
        
        for index in 0 ..< userFavorurite.count {
            if nameOfproduct == userFavorurite[index] {
                isFavorurite.toggle()
            }
        }
        return isFavorurite
    }
}


