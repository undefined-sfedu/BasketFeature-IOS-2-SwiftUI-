//
//  Action.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 03.11.2022.
//

import Foundation
class Action{
    var time = ""
    var typeOfBeginAttack = ""
    var secondOfAction = 0
    var lineOfPlayersInAction = [Int]()
    var typeOfAttack = ""
    var team = ""
}

class Foul: Action{
    init(action: Action){
        super.init()
        self.time = action.time
        self.typeOfBeginAttack = action.typeOfBeginAttack
        self.secondOfAction = action.secondOfAction
        self.lineOfPlayersInAction = action.lineOfPlayersInAction
        self.typeOfAttack = action.typeOfAttack
        self.team = action.team
    }
    
    var typeOfFoul = ""
    var arrayOfShots = [Bool]()
}

class Loss: Action{
    init(action: Action){
        super.init()
        self.time = action.time
        self.typeOfBeginAttack = action.typeOfBeginAttack
        self.secondOfAction = action.secondOfAction
        self.lineOfPlayersInAction = action.lineOfPlayersInAction
        self.typeOfAttack = action.typeOfAttack
        self.team = action.team
    }
    var typeOfLoss = ""
}

class Shot: Action{
    init(action: Action){
        super.init()
        self.time = action.time
        self.typeOfBeginAttack = action.typeOfBeginAttack
        self.secondOfAction = action.secondOfAction
        self.lineOfPlayersInAction = action.lineOfPlayersInAction
        self.typeOfAttack = action.typeOfAttack
        self.team = action.team
    }
    var typeOfEnding = ""
    var numberOfZone = 0
    var resultOfShot = ""
    var assist = false
}
