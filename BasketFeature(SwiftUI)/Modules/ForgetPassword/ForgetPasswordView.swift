//
//  ForgetPasswordView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    // MARK: Properties
    
    @State var count: Int = 15
    @State var titleOfTimer = "повторный код через 0:15"
    @StateObject var viewModel = ForgetPasswordViewModel()
    @Binding var presentAlertOnLoginView: Bool
    @Environment (\.dismiss) var dismiss
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // MARK: Body
    var body: some View {
        
        VStack{
            HStack {
                Text(^String.RestorePassword.title)
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
            CustomTextField(description: $viewModel.emailDescription)
            Spacer()
            ViewFactory.defaultLargeButton(^String.RestorePassword.title, completion: { viewModel.sendEmail() })
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
    
   
    // MARK: - Restore Code View and its subviews
    var RestoreCodeView: some View{
        VStack{
            CustomTextField(description: $viewModel.codeDescription)
            Spacer()
            if viewModel.canSendCode{
                GetNewCodeButton
            }
            else{
                TimerText
            }
            ViewFactory.defaultLargeButton(^String.Common.confirm, completion: { viewModel.sendCode() })
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
    
    
    // MARK: - Send New Password View and its subviews
    
    var SendNewPasswordView: some View {
        VStack{
            CustomTextField(description: $viewModel.passwordDescription, isSecureField: true)
            CustomTextField(description: $viewModel.repeatPasswordDescription, isSecureField: true)
            Spacer()
            ViewFactory.defaultLargeButton(^String.Common.confirm, completion: { sendPassword() })
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
    
    private func sendPassword() {
        viewModel.sendPasswords()
        dismiss()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            presentAlertOnLoginView.toggle()
        }
    }
    
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView(presentAlertOnLoginView: .constant(false))
    }
}
