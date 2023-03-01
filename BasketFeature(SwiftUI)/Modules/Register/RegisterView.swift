//
//  ContentView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import SwiftUI

struct RegisterView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel = RegisterViewModel()
    @State private var presentPopUp = false
    @State private var haveAccount = false
    @State private var confirmAccount = false
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            NavigationLink(destination: CustomTabBar(), isActive: $viewModel.goToNextView) { EmptyView() }
            NavigationLink(destination: LoginView(), isActive: $haveAccount) { EmptyView() }
            
            ScrollView(showsIndicators: false) {
                CustomTextField(description: $viewModel.emailDescription)
                Text(^String.Register.passwordDescription)
                    .padding(.horizontal)
                CustomTextField(description: $viewModel.passwordDescription, isSecureField: true)
                CustomTextField(description: $viewModel.repeatPasswordDescription, isSecureField: true)
            
            
                ViewFactory.defaultLargeButton((^String.Register.register).capitalizeFirstLetter()) { viewModel.register() }
                    .padding(.horizontal)
                
                AlreadyHaveAccountButton
            }
            .sheet(isPresented: $viewModel.presentPopUp, content: { PopUpView })
            .navigationTitle(^String.Register.registration)
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    // MARK: - Custom Views
    
    var AlreadyHaveAccountButton: some View {
        Button {
            haveAccount.toggle()
            
        } label: {
            Text(^String.Register.alreadyHaveAccount)
                .foregroundColor(.black)
                .underline()
        }
    }
    
    var PopUpView: some View {
        VStack {
            HStack {
                Text(^String.EmailConfirmation.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
            Text(^String.EmailConfirmation.description)
                .frame(maxWidth:.infinity)
            
            Spacer()
            ViewFactory.defaultLargeButton(^String.Common.confirm) {
                viewModel.presentPopUp.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                    goToTeamView.toggle()
                }
            }
        }
        
        .padding(.all)
    }
    
    
}
// MARK: - Preview Provider
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
        }
    }
}
