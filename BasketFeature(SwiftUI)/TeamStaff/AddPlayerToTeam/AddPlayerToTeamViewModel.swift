//
//  ShowTeamViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 04.10.2022.
//

import Foundation
import SwiftUI
import Combine
class AddPlayerToTeamViewModel: ObservableObject{
    private var model = AddPlayerToTeamModel()
     var viewDismissalModePublisher = PassthroughSubject<Bool, Never>()
        private var shouldDismissView = false {
            didSet {
                viewDismissalModePublisher.send(shouldDismissView)
            }
        }
    
    
    init(){
        model.viewModel = self
    }
    @Published var textFieldsDescription = [
        TextFieldDescription(placeholder: "Фамилия", titleOfError: "неверный формат", borderColor: .customGray, titleColor: .black, visibleOfError: false),
        TextFieldDescription(placeholder: "Имя", titleOfError: "неверный формат", borderColor: .customGray, titleColor: .black, visibleOfError: false),
        TextFieldDescription(placeholder: "Отчество", titleOfError: "неверный формат", borderColor: .customGray, titleColor: .black, visibleOfError: false),
        TextFieldDescription(placeholder: "Номер", titleOfError: "неверный формат", borderColor: .customGray, titleColor: .black, visibleOfError: false)
    ]
    
    // MARK: - View's methods
    func addPlayer(teamId: Int){
        if correctInputData(){
            let player = Player(serverId: 0, teamId: teamId,
                                name: textFieldsDescription[AddPlayerToTeamView.IndexesOfDescription.name.rawValue].fieldValue,
                                lastName: textFieldsDescription[AddPlayerToTeamView.IndexesOfDescription.lastName.rawValue].fieldValue,
                                middleName: textFieldsDescription[AddPlayerToTeamView.IndexesOfDescription.middleName.rawValue].fieldValue,
                                number: Int(textFieldsDescription[AddPlayerToTeamView.IndexesOfDescription.number.rawValue].fieldValue)!)
            model.addPlayersToTeam(teamId: teamId, player: player)
        }
        
    }
    
    // MARK: - Model's methods
    func updateView(){
        shouldDismissView.toggle()
    }
    
}

private extension AddPlayerToTeamViewModel{
    func correctInputData() -> Bool{
        var res = true
        
        
        
        for i in textFieldsDescription.indices{
            if textFieldsDescription[i].fieldValue.isEmpty && textFieldsDescription[i].placeholder != textFieldsDescription[AddPlayerToTeamView.IndexesOfDescription.middleName.rawValue].placeholder {
                textFieldsDescription[i].visibleOfError = true
                res = false
            }
            
            if textFieldsDescription[i].placeholder == textFieldsDescription[AddPlayerToTeamView.IndexesOfDescription.number.rawValue].placeholder && Int(textFieldsDescription[i].fieldValue) == nil{
                textFieldsDescription[i].visibleOfError = true
                res = false
                    
            }
        }
        
        return res
    }
}
