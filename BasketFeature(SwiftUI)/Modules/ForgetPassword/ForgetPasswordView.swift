//
//  ForgetPasswordView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import SwiftUI

struct ForgetPasswordView: View {
    @State var count: Int = 15
    @State var titleOfTimer = "повторный код через 0:15"
    @StateObject var viewModel = ForgetPasswordViewModel()
    @Binding var presentAlertOnLoginView: Bool
    @Environment (\.dismiss) var dismiss
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    var body: some View {
        
        VStack{
            HStack {
                Text("Восстановить пароль")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(2)
                Spacer()
            }
            .padding(.all)
            
            
            HStack {
                Text("\(viewModel.smallTitle)")
                    .lineLimit(2)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            
            
            
            switch viewModel.whatViewPresent{
            case .sendEmail:
                EnterEmailView
                
            case .sendCode:
                RestoreCodeView
                    .onReceive(timer) { _ in
                        count -= 1
                        if count >= 10{
                            titleOfTimer = "повторный код через 0:\(count)"
                        }
                        else if count >= 1 && count < 10{
                            titleOfTimer = "повторный код через 0:0\(count)"
                        }
                        else{
                            viewModel.canSendCode = true
                            count = 15
                        }
                        
                    }
                
            case .sendPassword:
                SendNewPasswordView
            }
            
            
        }
        
    }
    // MARK: - Email View and its subviews
    var EnterEmailView: some View{
        VStack{
//            CustomTextField(description: $viewModel.emailDescription)
            Spacer()
            RestorePasswordButton
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
    
    var RestorePasswordButton: some View{
        Button {
            viewModel.sendEmail()
        } label: {
            Text("Восстановить пароль")
                .font(.system(size: 24))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.appOrange.cornerRadius(10))
        }
    }
    // MARK: - Restore Code View and its subviews
    var RestoreCodeView: some View{
        VStack{
//            CustomTextField(description: $viewModel.codeDescription)
            Spacer()
            if viewModel.canSendCode{
                GetNewCodeButton
            }
            else{
                TimerText
            }
            SendCodeButton
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
    
    var GetNewCodeButton: some View{
        Button {
            viewModel.getNewCodeOnEmail()
        } label: {
            Text("выслать новый код")
                .underline()
                .foregroundColor(.appGray)
        }
    }
    
    var TimerText: some View{
        Text("\(titleOfTimer)")
            .foregroundColor(.appGray)
    }
    
    var SendCodeButton: some View{
        Button {
            viewModel.sendCode()
        } label: {
            Text("Подтвердить")
                .font(.system(size: 24))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.appOrange.cornerRadius(10))
        }
    }
    
    // MARK: - Send New Password View and its subviews
    var SendNewPasswordView: some View{
        VStack{
//            CustomTextField(description: $viewModel.passwordDescription, isSecureField: true)
//            CustomTextField(description: $viewModel.repeatPasswordDescription, isSecureField: true)
            Spacer()
            SendPasswordButton
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
    
    var SendPasswordButton: some View{
        Button {
            viewModel.sendPasswords()
            dismiss()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                presentAlertOnLoginView.toggle()
            }
            
        } label: {
            Text("Подтвердить")
                .font(.system(size: 24))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.appOrange.cornerRadius(10))
        }
    }
    
    
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView(presentAlertOnLoginView: .constant(false))
    }
}
