//
//  ContentView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    @State var presentPopUp = false
    @State var haveAccount = false
    @State var confirmAccount = false
//    @State var goToTeamView = false
    var body: some View {
        
        VStack {
            NavigationLink(destination: CustomTabBar(), isActive: $viewModel.goToNextView) {EmptyView()}
            NavigationLink(destination: LoginView(), isActive: $haveAccount) {EmptyView()}
            ScrollView(showsIndicators: false){
                CustomTextField(description: $viewModel.emailDescription)
                
                Text("Пароль должен содержать минимум 8 символов латинскими буквами, а также хотя бы одну цифру")
                    .padding(.horizontal)
                
                CustomTextField(description: $viewModel.passwordDescription, isSecureField: true)
                CustomTextField(description: $viewModel.repeatPasswordDescription, isSecureField: true)
                
                RegisterButton
                    .padding(.horizontal)
                AlreadyHaveAccountButton
                    .padding(.horizontal)
                
            }
            .navigationTitle("Регистрация")
            .navigationBarBackButtonHidden(true)
        }
    
//        .sheet(isPresented: $viewModel.presentPopUp) {
//            PopUpView
//        }
        
        
    }
    
    var RegisterButton: some View{
        Button {
            viewModel.register()
//            goToTeamView.toggle()
            
        } label: {
            Text("Зарегистрироваться")
//                .font(.largeTitle)
                .font(.system(size: 23))
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.appOrange.cornerRadius(10))
        }
        
    }
    
    var AlreadyHaveAccountButton: some View{
        Button {
            haveAccount.toggle()
            
        } label: {
            Text("уже есть аккаунт")
                .foregroundColor(.black)
                .underline()
        }
    }
    
    var PopUpView: some View{
        
        VStack{
            HStack {
                Text("Подтверждение почты")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
            Text("Вам на почту был отправлена ссылка для подтверждения. Пройдите по ссылке, чтобы активировать ваш аккаунт.")
                .frame(maxWidth:.infinity)
            
            Spacer()
            Button {
                viewModel.presentPopUp.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                    goToTeamView.toggle()
                }
            } label: {
                Text("Подтвердить")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color.appOrange.cornerRadius(10))
            }
        }
        
        .padding(.all)
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
