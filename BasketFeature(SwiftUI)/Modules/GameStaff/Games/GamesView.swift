//
//  GamesView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        NavigationView{
        Text("")
        
            .navigationBarItems(leading: LeadingItem,
                                trailing: TrailingItem)
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
