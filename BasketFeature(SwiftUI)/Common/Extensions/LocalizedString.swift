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
        case confirm
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
    }
    
    enum SignIn: String {
        case enter
        case forgetPassword
    }
    
    enum RestorePassword: String {
        case title
    }
    
    enum TextFieldError: String {
        case invalidFormat
        case differentPasswords
        case invalidPassword
        case invalidEmail
        case invalidPasscode
        case emailIsNotRegistered
    }
    
    enum TextFieldPlaceholders: String {
        case enterPasscode
        case enterPassword
        case named
        case number
        case name
        case lastName
        case middleName
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
