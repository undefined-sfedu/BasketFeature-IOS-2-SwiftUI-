//
//  addTeamViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 04.10.2022.
//

import Foundation
import SwiftUI
import Combine
class AddTeamViewModel: ObservableObject{
    
    var viewDismissalModePublisher = PassthroughSubject<Bool, Never>()
        private var shouldDismissView = false {
            didSet {
                viewDismissalModePublisher.send(shouldDismissView)
            }
        }
    @Published var teamTextFieldDescription = TextFieldDescription(placeholder: "Название", titleOfError: "неверный формат", borderColor: .customGray, titleColor: .black, visibleOfError: false)
    @Published var countOfPlayers: Double = 5{
        willSet{
            if newValue > countOfPlayers{
                for _ in 1...Int(newValue-countOfPlayers){
                    playersCells.append(TextFieldDescription(placeholder: "Номер*", titleOfError: "неверный формат", borderColor: .customGray, titleColor: .black, visibleOfError: false))
                }
            }
            else if newValue < countOfPlayers{
                for _ in 1...Int(countOfPlayers-newValue){
                    playersCells.removeLast()
                }
            }
        }
    }
    @Published var playersCells: [TextFieldDescription] = Array(repeating: TextFieldDescription(placeholder: "Номер*", titleOfError: "неверный формат", borderColor: .customGray, titleColor: .black, visibleOfError: false), count: 5)
    var model = AddTeamModel()
    init(){
        model.viewModel = self
    }
    
    func createTeam(){
        
        if nameOfTeamAndNumbersOfPlayersAreCorrect(){
            var players = [String]()
            playersCells.forEach { item in
                players.append(item.fieldValue)
            }
            model.createTeam(name: teamTextFieldDescription.fieldValue, players: players)
        }
    }
    
    // MARK: - Models Methods
    func updateView(){
        shouldDismissView = true
        
    }
    
}

private extension AddTeamViewModel{
    func nameOfTeamAndNumbersOfPlayersAreCorrect() -> Bool{
        
        var res = true
        if teamTextFieldDescription.fieldValue.isEmpty{
            teamTextFieldDescription.visibleOfError = true
            res = false
        }
        
        for i in playersCells.indices{
            if playersCells[i].fieldValue.isEmpty || Int(playersCells[i].fieldValue) == nil{
                playersCells[i].visibleOfError = true
                res = false
            }
        }
        
//        for var item in playersCells{
//
//        }
        
        return res
    }
}
