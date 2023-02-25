//
//  LoginView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 28.09.2022.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State var goToForgetPassword = false
    @State var presentAlertChangedPassword = false
    @State var presentEmailIsNotConfirm = false
    @State var goToConfirmEmail = false
    var body: some View {
        
        ZStack {
            NavigationLink(destination: RegisterView(), isActive: $goToConfirmEmail) {EmptyView()}
            NavigationLink(destination: CustomTabBar(), isActive: $viewModel.goToMainScreen) {EmptyView()}
            VStack {
                ScrollView {
                    Image("logoBack")
                        .resizable()
                        .scaledToFit()
                    
                    CustomTextField(description: $viewModel.emailDescription)
                    CustomTextField(description: $viewModel.passwordDescription, isSecureField: true)
                    
                    ForgetPassword
                        .sheet(isPresented: $goToForgetPassword) {
                            ForgetPasswordView(presentAlertOnLoginView: $presentAlertChangedPassword)
                        }
                    

                    ViewFactory.defaultLargeButton(^String.SignIn.enter, completion: { viewModel.enter() })
                        .padding(.horizontal)
                    RegisterButton
                    
                }
            }
            CustomAlert(isShow: $presentAlertChangedPassword, largeTitle: "Пароль изменен", smallTitle: "Войдите заново", titleButton: "Ок", selfClosed: true)
            CustomAlert(isShow: $presentEmailIsNotConfirm, largeTitle: "Почта не подтверждена", smallTitle: "вам выслана новая ссылка", titleButton: "Ок", selfClosed: false, onDone: {
                goToConfirmEmail.toggle()
            })
            
        }
        
        .navigationBarHidden(true)
    }
    
    
    var ForgetPassword: some View{
        Button {
            goToForgetPassword.toggle()
        } label: {
            Text("забыл пароль")
                .foregroundColor(.black)
        }
        
    }
    
    var RegisterButton: some View{
        Button {
            goToConfirmEmail.toggle()
        } label: {
            Text("зарегистрироваться")
                .underline()
                .foregroundColor(.black)
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
