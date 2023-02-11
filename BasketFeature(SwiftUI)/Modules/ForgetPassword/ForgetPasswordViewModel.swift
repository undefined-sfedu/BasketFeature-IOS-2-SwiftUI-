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
    @Published var emailDescription = TextFieldDescription(fieldValue: "", placeholder: "Электронная почта", titleOfError: "данная почта не зарегистрирована", borderColor: .appGray, titleColor: .black, visibleOfError: false)
    @Published var codeDescription = TextFieldDescription(fieldValue: "", placeholder: "Введите код", titleOfError: "неверный код", borderColor: .appGray, titleColor: .black, visibleOfError: false)
    @Published var passwordDescription = TextFieldDescription(fieldValue: "", placeholder: "Введите пароль", titleOfError: "неверный формат", borderColor: .appGray, titleColor: .black, visibleOfError: false)
    @Published var repeatPasswordDescription = TextFieldDescription(fieldValue: "", placeholder: "Повторите пароль", titleOfError: "пароли не совпадают", borderColor: .appGray, titleColor: .black, visibleOfError: false)
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
