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
    @Published var emailDescription = TextFieldModel(placeholder: ^String.Common.email, titleOfError: ^String.TextFieldError.invalidFormat)
    @Published var passwordDescription = TextFieldModel(placeholder: ^String.Common.password, titleOfError: ^String.TextFieldError.invalidFormat)
    @Published var repeatPasswordDescription = TextFieldModel(placeholder: ^String.Common.password,  titleOfError: ^String.TextFieldError.differentPasswords)
    @Published var presentPopUp = false
    @Published var goToNextView = false
    
    init(){
        model.viewModel = self
    }
    
    
    // MARK: - View's Methods
    func register() {
        
//        presentPopUp.toggle()
        
//        if checkFields() {
//            model.register(email: emailDescription.fieldValue, password: passwordDescription.fieldValue)
//        }
        checkFields()
    }
    
    // MARK: - Model's Methods
    func userIsRegistered(){
        goToNextView.toggle()
    }
}

private extension RegisterViewModel{
    
    func checkFields() -> Bool{
        
        var res = true
        if emailDescription.fieldValue.contains("@") == false{
            emailDescription.visibleOfError = true
            
            res = false
        }
        
        if passwordDescription.fieldValue != repeatPasswordDescription.fieldValue{
            emailDescription.visibleOfError = true
            repeatPasswordDescription.visibleOfError = true
            res = false
        }
        
        if passwordDescription.fieldValue.count < 8 || repeatPasswordDescription.fieldValue.count < 8{
            repeatPasswordDescription.visibleOfError = true
            res = false
        }
        
        if !checkNumInString(password: passwordDescription.fieldValue){
            passwordDescription.visibleOfError = true
            res = false
        }
        if !checkNumInString(password: repeatPasswordDescription.fieldValue){
            passwordDescription.visibleOfError = true
            res = false
        }
        return res
        
        
        
    }
    
    func checkNumInString(password: String) -> Bool{
        for i in passwordDescription.fieldValue{
            if i.isNumber{
                return true
                
            }
        }
        return false
    }
}
