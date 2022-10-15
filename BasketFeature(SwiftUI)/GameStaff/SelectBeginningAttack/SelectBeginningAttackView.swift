//
//  SelectAttackView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 15.10.2022.
//

import SwiftUI

struct SelectBeginningAttackView: View {
    @StateObject var viewModel = SelectBeginningAttackViewModel()
    @State var nextScreen = false
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        
        VStack{
            NavigationLink(destination: PropertyView(), isActive: $nextScreen) {EmptyView()}
            ForEach(viewModel.typesOfAttack, id: \.self) { i in
                Button {
                    nextScreen.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black)
                        .overlay(
                            Text(i)
                                .foregroundColor(.black)
                                .font(.system(size: 24))
                        )
                }
            }
            BackButton
        }
        .padding(.horizontal)
        .padding(.bottom)
        .navigationBarItems(leading: MainTitle)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    
    var MainTitle: some View{
        Text("Начало атаки")
            .font(.system(size: 24))
            .foregroundColor(.black)
            .fontWeight(.medium)
    }
    
    var BackButton: some View{
        Button {
            dismiss()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.customOrange, lineWidth: 3)
                .overlay(
                 Image("Arrow.left")
                        .foregroundColor(.customOrange)
                        .font(.system(size: 24))
                )
                .frame(height: UIScreen.main.bounds.height * 0.1)
        }
    }
}

struct SelectBeginningAttack_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SelectBeginningAttackView()
        }
    }
}
