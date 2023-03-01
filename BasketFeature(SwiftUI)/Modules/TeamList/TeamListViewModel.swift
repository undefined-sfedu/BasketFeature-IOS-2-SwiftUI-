//
//  TeamViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import Foundation
class TeamListViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private var model = TeamListModel()
    @Published var teams = [Team]()
    
    init() {
        getTeams()
    }
    
    // MARK: - Methods
    
    func getTeams() {
        model.getTeams() { [weak self] teams in
            self?.teams = teams
        }
    }
    
}


