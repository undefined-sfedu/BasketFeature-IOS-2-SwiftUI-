//
//  CreateGameViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import Foundation
import SwiftUI
class CreateGameViewModel: ObservableObject{
    var model = CreateGameModel()
    @Published var teams = [Team]()
    @Published var teamsName = ["Example1", "Example2", "Example3", "Example1", "Example2", "Example3", "Example1", "Example2", "Example3", "Example1", "Example2", "Example3"]
    init(){
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
        teams.forEach { item in
            teamsName.append(item.name)
        }
    }
    
}
