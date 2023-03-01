//
//  addTeamViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 04.10.2022.
//

import Foundation
import SwiftUI
import Combine
class AddTeamViewModel: ObservableObject {
    
    var viewDismissalModePublisher = PassthroughSubject<Bool, Never>()
        private var shouldDismissView = false {
            didSet {
                viewDismissalModePublisher.send(shouldDismissView)
            }
        }
    @Published var teamTextFieldDescription = TextFieldModel(placeholder: ^String.TextFieldPlaceholders.named, titleOfError: ^String.TextFieldError.invalidFormat)
    @Published var countOfPlayers: Double = 5 {
        willSet{
            if newValue > countOfPlayers{
                for _ in 1...Int(newValue-countOfPlayers) {
                    playersCells.append(TextFieldModel(placeholder: ^String.TextFieldPlaceholders.number, titleOfError: ^String.TextFieldError.invalidFormat))
                }
            } else if newValue < countOfPlayers {
                for _ in 1...Int(countOfPlayers-newValue) {
                    playersCells.removeLast()
                }
            }
        }
    }
    @Published var playersCells: [TextFieldModel] = Array(repeating: TextFieldModel(placeholder: ^String.TextFieldPlaceholders.number, titleOfError: ^String.TextFieldError.invalidFormat), count: 5)
    var model = AddTeamModel()
    
    func createTeam() {
        if nameOfTeamAndNumbersOfPlayersAreCorrect() {
            var players = [Int]()
            playersCells.forEach { item in
                players.append(Int(item.fieldValue)!)
            }
            model.createTeam(name: teamTextFieldDescription.fieldValue, players: players) { [weak self] in
                self?.updateView()
            }
        }
    }
    
    // MARK: - Models Methods
    func updateView() {
        shouldDismissView = true
    }
    
}

private extension AddTeamViewModel {
    func nameOfTeamAndNumbersOfPlayersAreCorrect() -> Bool {
        
        var res = true
        if teamTextFieldDescription.fieldValue.isEmpty {
            teamTextFieldDescription.visibleOfError = true
            res = false
        }
        
        for i in playersCells.indices {
            if playersCells[i].fieldValue.isEmpty || Int(playersCells[i].fieldValue) == nil{
                playersCells[i].visibleOfError = true
                res = false
            }
        }
        return res
    }
    
}
