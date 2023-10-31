//
//  GamesView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import SwiftUI

struct GamesView: View {
    @State var showAlert = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.black)
                        GameCell(title: "Химки – ЦСКА", dateString: "21.07.2023")
                    }
                    .frame(height: 50)
                    .padding(.top, 30)
                    .padding(.horizontal)
                    Spacer()
                }
                .gesture(TapGesture().onEnded({ _ in
                    showAlert.toggle()
                }))
                .navigationBarItems(leading: LeadingItem,
                                trailing: TrailingItem)
                CustomAlert(isShow: $showAlert, largeTitle: "Ошибка!", smallTitle: "Нет соединения с сервером", titleButton: "Ok", selfClosed: false) {
                    showAlert.toggle()
                }
            }
        }
    }
    
    
    
    var LeadingItem: some View{
        Text("Игры")
            .font(.system(size: 24))
            .fontWeight(.bold)
    }
    
    var TrailingItem: some View{
        NavigationLink(destination: CreateGameView(),
                       label: {
            Image(systemName: "plus")
                .foregroundColor(.black)
            
        })
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
