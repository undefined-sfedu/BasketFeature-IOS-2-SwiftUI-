//
//  LocalUser.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 05.10.2022.
//

import Foundation
struct LocalUser{
    enum UserKeys: String{
        case id = "user_ID"
        case email = "user_Email"
        case firstName = "user_FirstName"
        case lastName = "user_LiddleName"
        case middleName = "user_MiddleName"
    }
    
    func writeData(typeOfData: UserKeys, data: String){
        let standard = UserDefaults.standard
        standard.set(data, forKey: typeOfData.rawValue)
    }
    
    func getData(typeOfData: UserKeys) -> String{
        UserDefaults.standard.string(forKey: typeOfData.rawValue) ?? "ERROR: SOMETHING WRONG WITH \(LocalUser.self) CLASS"
    }
}
