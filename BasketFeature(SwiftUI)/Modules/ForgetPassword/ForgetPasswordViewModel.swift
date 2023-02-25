//
//  ForgetPasswordViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import Foundation
import SwiftUI
class ForgetPasswordViewModel: ObservableObject{
    enum PresentViewType{
        case sendEmail
        case sendCode
        case sendPassword
    }
    @Published var whatViewPresent: PresentViewType = .sendEmail
    //MARK: - Text Field Descriptions
    @Published var emailDescription = TextFieldModel(placeholder: ^String.Common.email, titleOfError: ^String.TextFieldError.emailIsNotRegistered)
    @Published var codeDescription = TextFieldModel(placeholder: ^String.TextFieldPlaceholders.enterPasscode, titleOfError: ^String.TextFieldError.invalidPasscode)
    @Published var passwordDescription = TextFieldModel(placeholder: ^String.TextFieldPlaceholders.enterPassword, titleOfError: ^String.TextFieldError.invalidFormat)
    @Published var repeatPasswordDescription = TextFieldModel(placeholder: ^String.Common.repeatPassword, titleOfError: ^String.TextFieldError.differentPasswords)
    //MARK: - Reusable variable
    @Published var smallTitle = "К какой почте привязан ваш аккаунт?"
    //MARK: - Timer Logic
    
    @Published var canSendCode = false
    //MARK: - Funcs
    func sendEmail(){
        smallTitle = "Вам на почту был отправлен код для восстановления"
        whatViewPresent = .sendCode
    }
    
    func getNewCodeOnEmail(){
        canSendCode.toggle()
    }
    
    func sendCode(){
        whatViewPresent = .sendPassword
        smallTitle = "Введите новый пароль"
    }
    
    func sendPasswords(){
        
    }
}
