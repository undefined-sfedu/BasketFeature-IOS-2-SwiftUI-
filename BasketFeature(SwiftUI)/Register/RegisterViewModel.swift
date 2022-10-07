//
//  RegisterViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import Foundation
import SwiftUI
class RegisterViewModel: ObservableObject{
    private var model = RegisterModel()
    @Published var emailDescription = TextFieldDescription(placeholder: "Электронная почта", titleOfError: "неверный формат")
    @Published var passwordDescription = TextFieldDescription(placeholder: "Пароль", titleOfError: "неверный формат")
    @Published var repeatPasswordDescription = TextFieldDescription(placeholder: "Повторите пароль",  titleOfError: "пароли не совпадают")
    @Published var presentPopUp = false
    
    init(){
        model.viewModel = self
    }
    
    
    
    func register(){
//        model.register(email: emailDescription.fieldValue, password: passwordDescription.fieldValue)
        checkFields()
    }
}

private extension RegisterViewModel{
    
    func checkFields(){
        var count = 0
        

            emailDescription.visibleOfError = true
            
            count += 1

        
//        if passwordDescription.fieldValue == ""{
            
            passwordDescription.visibleOfError = true
            
            count += 1
//        }
        
//        if repeatPasswordDescription.fieldValue == ""{
            
            repeatPasswordDescription.visibleOfError = true
            
            count += 1
//        }
//        if count == 0 {
            presentPopUp.toggle()
//        }
    }
}
