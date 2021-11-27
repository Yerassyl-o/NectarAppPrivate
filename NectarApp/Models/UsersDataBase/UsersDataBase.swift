////
////  File.swift
////  NectarApp
////
////  Created by Yerassyl Orazbekov on 25.11.2021.
////
//
//import UIKit
//
//
//struct UserFavorurites {
//    var favorurites: ProductStruct
//    var count: Int
//}
//struct UserDataBaseStruct {
//    var userNumber: Int?
//    var userEmail: String?
//    var userPassword: String?
//    var userLocations: String?
//    var userFavorurites: [UserFavorurites]?
//    var userCarts: [ProductStruct]?
//}
//
//class UserDataBase {
//    static let shared = UserDataBase()
//    let userDataBaseDefaults = UserDefaults.standard
//    var getUserDataBaseDefaults: UserDefaults {
//        return userDataBaseDefaults
//    }
//    var userDataBase: [UserDataBaseStruct] {
//
//        get{
//            if let data = userDataBaseDefaults.value(forKey: "users") as? Data{
//                return try! PropertyListDecoder().decode([UserDataBaseStruct].self, from: data)
//            } else{
//                return [UserDataBaseStruct]()
//            }
//        }
//
//        set{
//            if let data = try? PropertyListEncoder().encode(newValue){
//                userDataBaseDefaults.set(data, forKey: "users")
//            }
//        }
//
//    }
//
////  метод для сохранение информации очереда
//    func saveClient(){
//        let clientData = UserDataBaseStruct()
//        userDataBase.append(clientData)
//    }
//}
