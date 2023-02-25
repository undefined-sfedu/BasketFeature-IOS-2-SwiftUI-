//
//  CreateGameViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import Foundation
import SwiftUI
class CreateGameViewModel: ObservableObject{
    
    private var model = CreateGameModel()
    @Published private var teams = [Team]()
    @Published var teamsName = [String]()
    @Published var teamA: Team? = nil
    @Published var teamB: Team? = nil
    @Published var showAlert = false
    init(){
        model.viewModel = self
        getTeams()
    }
    
    
    // MARK: - View Methods
    func getTeams(){
        model.getTeams()
    }
    
    
    func getTeamByName(name: String) -> Team{
        var res: Team? = nil
        for team in teams where team.name == name{
            res = team
            break
        }
        return res!
    }
    
    func checkData(teamAName: String, teamBName: String) -> Bool{
        if teamsName.contains(teamAName) && teamsName.contains(teamBName){
            for team in teams where team.name == teamAName{
                teamA = team
            }
            
            for team in teams where team.name == teamBName{
                teamB = team
            }
            
            return true
        }
        else{
            showAlert.toggle()
            return false
        }
    }
    
    
    // MARK: - Model Methods
    func updateTeams(team: [Team]){
        teams = team
        teams.forEach { item in
            teamsName.append(item.name)
        }
    }
    
}
