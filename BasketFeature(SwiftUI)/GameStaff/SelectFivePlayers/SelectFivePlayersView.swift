//
//  SelectFivePlayersView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import SwiftUI

struct SelectFivePlayersView: View {
//    @State var data = [0, 7, 9, 10, 11, 25, 31, 41, 43, 54, 65, 70, 71, 89]
    @State var data = [
        [0, 7, 9, 10, 11],
        [25, 31, 41, 43, 54],
        [65, 70, 71, 89]
    ]
    
    init(){
        
    }
    var body: some View {
        VStack{
            Text("Название команды")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical)
            teamPlayers
            Divider()
                .frame(height: 3)
                .overlay(Color.customOrange)
                .padding(.horizontal)
                
            Spacer()
            
            
        }
        
            .navigationTitle("Стартовая пятерка")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    var teamPlayers: some View{
        VStack{
            ForEach(0..<data.count) { i in
                HStack{
                    ForEach(0..<data[i].count) { j in
                        Text("\(data[i][j])")
                    }
                }
            }
        }
    }
    
    
}

struct SelectFivePlayersView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        SelectFivePlayersView()
        }
    }
}
