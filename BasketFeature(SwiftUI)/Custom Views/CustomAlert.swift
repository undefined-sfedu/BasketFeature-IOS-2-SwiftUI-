//
//  CustomAlert.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import SwiftUI

struct CustomAlert: View {
    let size = UIScreen.main.bounds
    @Binding var isShow: Bool
    var largeTitle: String
    var smallTitle: String
    var titleButton: String
    var selfClosed: Bool
    var onDone: () -> Void = {}
    var body: some View {
        ZStack {
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text(largeTitle)
                    .font(.system(size: 24))
                    .bold()
                    .padding(.vertical)
                Text(smallTitle)
                    .padding(.bottom)
                
                Divider()
                    .frame(height: 1)
                    .overlay(Color.customOrange)
                
                Button {
                    if selfClosed{
                        isShow.toggle()
                    }
                    else{
                        onDone()
                    }
                } label: {
                    Text(titleButton)
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                }
                .padding(.vertical)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            .padding(.horizontal)
            
        } .offset(y: isShow ? 0 : -size.height)
            .transition(AnyTransition.opacity.animation(.spring()))
        
        
        
        
        
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(isShow: .constant(true), largeTitle: ("Пароль Изменен"), smallTitle: ("войдите заново"), titleButton: ("Ок"), selfClosed: false)
    }
}
