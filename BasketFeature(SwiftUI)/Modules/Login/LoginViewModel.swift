//
//  LoginViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 28.09.2022.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    private var model = LoginModel()
    
    enum RequestStatus {
        case canEnter
        case wrongEmail
        case wrongPassword
        case all
    }
    
    @Published var emailDescription = TextFieldModel(placeholder: ^String.Common.email, titleOfError: ^String.TextFieldError.invalidEmail)
    @Published var passwordDescription = TextFieldModel(placeholder: ^String.Common.password, titleOfError:^String.TextFieldError.invalidPassword)
    @Published var goToMainScreen = false
    
    // MARK: - Methods
    
    func enter() {
        if dataIsCorrect() {
            model.enter(email: emailDescription.fieldValue, password: passwordDescription.fieldValue) { [weak self] res in
                self?.correctData(error: res)
            }
        } else {
            emailDescription.visibleOfError = true
            passwordDescription.visibleOfError = true
        }
    }
    
    func correctData(error: RequestStatus) {
        switch error {
        case .wrongEmail:
            emailDescription.visibleOfError = true
        case .wrongPassword:
            passwordDescription.visibleOfError = true
        case .all:
            emailDescription.visibleOfError = true
            passwordDescription.visibleOfError = true
        case .canEnter:
            goToMainScreen.toggle()
        }
    }
    
    // MARK: - Private Methods
    
    private func dataIsCorrect() -> Bool {
        if emailDescription.fieldValue.isEmpty || passwordDescription.fieldValue.isEmpty {
            return false
        }
        return true
    }
    
}


