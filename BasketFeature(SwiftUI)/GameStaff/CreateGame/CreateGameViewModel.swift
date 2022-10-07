//
//  CreateGameViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import Foundation
import SwiftUI
class CreateGameViewModel{
    var model = CreateGameModel()
    @Published var teams = [Team]()
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
    }
    
}
