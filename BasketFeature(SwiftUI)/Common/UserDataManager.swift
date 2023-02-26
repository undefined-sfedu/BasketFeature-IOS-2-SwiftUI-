//
//  UserDataManager.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 26.02.2023.
//

import Foundation

enum UserKeys: String {
    case id
    case email
    case firstName
    case lastName
    case middleName
    case user
}

class UserDataManager: PreferenceManager<UserKeys> {
    
    static let shared = UserDataManager()
    
    var user: User? {
        get {
            let data = object(for: .user) as? Data
            return try? JSONDecoder().decode(User.self, from: data!)
        } set {
            let data = try? JSONEncoder().encode(newValue)
            setObject(data as Any, for: .user)
        }
    }
}
