//
//  Game.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 01.11.2022.
//

import Foundation
class Game: ObservableObject{
    private var actions = [Action]()
    private var teamA = Team(backId: 0, userId: 0, name: "")
    private var teamB = Team(backId: 0, userId: 0, name: "")
    private var date = Date()
    var currentAction = Action()
    
    enum IndexOfTypesOfRes{
        case foul
        case shot
        case loss
    }
    
    func setTeam(team: Team, teamA: Bool){
        teamA == true ? (self.teamA = team) : (self.teamB = team)
    }
    
    func setDate(date: Date){
        self.date = date
    }
    
    func getTeam(isTeamA: Bool) -> Team{
        isTeamA ? teamA: teamB
    }
    
    func uniteSelectedAndUnselectedPlayersInTeam(isTeamA: Bool){
        isTeamA ? teamA.addSelectedPlayerToAllPlayers() : teamB.addSelectedPlayerToAllPlayers()
    }
    
    func getTeamByName(name: String) -> Team{
        teamA.name == name ? teamA : teamB
    }
    
    func addToListOfAction(){
        if currentAction.team != ""{
        actions.append(currentAction)
        printActionsData()
        }
    }
    
    private func printActionsData(){
        print()
        print("Count of actions - \(actions.count)")
        print("---------------------------")
        for i in 0...actions.count-1{
            print("Action №\(i+1)")
            printShotData(item: actions[i])
            var typeOfAction = ""
            if let loss = actions[i] as? Loss{
                typeOfAction = "Loss"
                print("type of loss \(loss.typeOfLoss)")
            }
            if let foul = actions[i] as? Foul{
                typeOfAction = "Foul"
                print("Type of action - \(typeOfAction)")
                print("type of foul - \(foul.typeOfFoul)")
                print("array of shots - \(foul.arrayOfShots)")
            }
            if let shot = actions[i] as? Shot{
                typeOfAction = "Shot"
                print("Type of action - \(typeOfAction)")
                print("number of zone - \(shot.numberOfZone)")
                print("type of ending - \(shot.typeOfEnding)")
                print("reulst of shot - \(shot.resultOfShot)")
                print("assist - \(shot.assist.description)")
            }
            print("---------------------------")
            
        }
    }
    
    private func printShotData(item: Action){
        
        print("Team - \(item.team)")
        print("time of game - \(item.time)")
        print("begin of attack - \(item.typeOfBeginAttack)")
        print("players - \(item.lineOfPlayersInAction)")
        print("time of attack - \(item.secondOfAction)")
        print("type of attack - \(item.typeOfAttack)\n")
        
    }
    
    
    
    
    
    
}
