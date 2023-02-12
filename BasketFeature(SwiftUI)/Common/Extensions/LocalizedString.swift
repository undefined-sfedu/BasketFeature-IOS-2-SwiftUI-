//
//  LocalizedString.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 11.02.2023.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    enum Common: String {
        case email
        case password
        case repeatPassword
    }
    
    enum Register: String {
        case passwordDescription
        case registration
        case alreadyHaveAccount
        case register
    }
    
    enum EmailConfirmation: String {
        case title
        case description
        case notConfirmatedEmail
        case confirm
    }
    
}

extension RawRepresentable {
    
    func format(_ args: CVarArg...) -> String {
        let format = ^self
        return String(format: format, arguments: args)
    }
    
}

prefix operator ^
prefix func ^<Type: RawRepresentable> (_ value: Type) -> String {
    let enumName = String(describing: Type.self)
    if let raw = value.rawValue as? String {
        let key = raw.capitalizeFirstLetter()
        return NSLocalizedString(enumName + key, comment: "")
    }
    return ""
}
