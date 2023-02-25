//
//  LoginViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 28.09.2022.
//

import Foundation
import SwiftUI
class LoginViewModel: ObservableObject{
    private var model = LoginModel()
    
    init(){
        model.viewModel = self
    }
    
    enum TypeOfError{
        case wrongEmail
        case wrongPassword
        case all
    }
    @Published var emailDescription = TextFieldModel(placeholder: ^String.Common.email, titleOfError: ^String.TextFieldError.invalidEmail)
    @Published var passwordDescription = TextFieldModel(placeholder: ^String.Common.password, titleOfError:^String.TextFieldError.invalidPassword)
    @Published var goToMainScreen = false
    // MARK: - View's Methods
    func enter(){
        if dataIsCorrect(){
            model.enter(email: emailDescription.fieldValue, password: passwordDescription.fieldValue)
        }
        else{
            emailDescription.visibleOfError = true
            passwordDescription.visibleOfError = true
        }
        
    }
    
    // MARK: - Model Methods
    func canEnter(){
        goToMainScreen.toggle()
    }
    
    func wrongData(error: TypeOfError){
        switch error {
        case .wrongEmail:
            emailDescription.visibleOfError = true
        case .wrongPassword:
            passwordDescription.visibleOfError = true
        case .all:
            emailDescription.visibleOfError = true
            passwordDescription.visibleOfError = true
        }
        
    }
}

private extension LoginViewModel{
    
    func dataIsCorrect() -> Bool{
        if emailDescription.fieldValue.isEmpty || passwordDescription.fieldValue.isEmpty{
            return false
        }
        return true
    }
}
