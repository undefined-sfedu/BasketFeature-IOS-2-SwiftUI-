//
//  TeamViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import Foundation
class TeamsViewModel: ObservableObject{
    private var model = TeamsModel()
    @Published var teams = [Team]()
    
    init(){
//        teams.forEach { item in
//            nameOfTeams.append(item.name)
//        }
//
//        for i in 0...teams.count - 1{
//            teams[i].players = getLocalPlayers()
//        }
        model.viewModel = self
        getTeams()
    }
    
    
// MARK: - View Methods
    func getTeams(){
        model.getTeams()
    }
// MARK: - Model Methods
    func updateTeams(team: [Team]){
        teams = team
    }

}


