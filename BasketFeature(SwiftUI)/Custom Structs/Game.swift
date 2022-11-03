//
//  Game.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 01.11.2022.
//

import Foundation
class Game: ObservableObject{
    var teamA: Team?
    var teamB: Team?
    var date: Date?
    
    init(teamA: Team?, teamB: Team?, date: Date?){
        self.teamA = teamA
        self.teamB = teamB
        self.date = date
    }
    
    func setTeam(team: Team, teamA: Bool){
        teamA == true ? (self.teamA = team) : (self.teamB = team)
    }
    
    func setDate(date: Date){
        self.date = date
    }
    
//    func getNotPreparedTeam() -> Team?{
//        if teamA?.selectedPlayers.count == 0{
//            return teamA
//        }
//
//        else if teamB?.selectedPlayers.count == 0{
//            return teamB
//        }
//
//        else{
//            return nil
//        }
//    }
    func getTeam(isTeamA: Bool) -> Team{
        isTeamA ? teamA!: teamB!
    }
    
    func uniteSelectedAndUnselectedPlayersInTeam(isTeamA: Bool){
        isTeamA ? teamA!.addSelectedPlayerToAllPlayers() : teamB!.addSelectedPlayerToAllPlayers()
    }
}
