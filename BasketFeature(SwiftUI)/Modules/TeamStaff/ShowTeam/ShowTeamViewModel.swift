//
//  ShowTeamViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import Foundation
import SwiftUI
class ShowTeamViewModel: ObservableObject{
    private var model = ShowTeamModel()
    @Published var players = [Player]()
    init(){
        model.viewModel = self
    }
    
    
    // MARK: - View's Methods
    func getPlayers(teamId: Int){
        model.getPlayers(teamId: teamId)
    }
    
    // MARK: - View's Methods
    func updatePlayers(newPlayers: [Player]){
        players = newPlayers
    }
}
