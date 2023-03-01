//
//  ShowTeamViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import Foundation
import SwiftUI
class TeamViewModel: ObservableObject {
    private var model = TeamModel()
    @Published var players = [Player]()
    init() {
        model.viewModel = self
    }
    
    
    // MARK: - Methods
    func getPlayers(teamId: Int) {
        model.getPlayers(teamId: teamId) { [weak self] players in
            self?.players = players
        }
    }
    
}
