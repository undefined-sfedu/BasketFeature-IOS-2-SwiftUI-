//
//  ServerHelper.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 05.10.2022.
//

import Foundation
struct ServerHelper{
    private let url = "http://85.193.83.34:8000"
    private let userPath = "/users/"
    private let teamPath = "/teams/"
    private let playerPath = "/players/"
    private let gamePath = "/games/"
    enum TypeOfParam{
        case userId
        case teamId
        case gameId
        case email
        case authData // there are login and password
        case withoutParam
        
    }
    
    enum TypeOfRequest{
        // users
        case createUser
        case readUser
        case getUserTeams
        case readUserByEmail
        case authUser
        // teams
        case createTeamForUser
        case getAllTeams
        case getTeamPlayers
        // players
        case createPlayerForTeam
        case getAllPlayers
        // games
        case createGame
        case getAllGames
        case getGameById
        case getUserGames
    }
    
    
    func getPath(typeOfrequest: TypeOfRequest, typeOfParam: TypeOfParam, param: [String]?) -> String{
        var res = ""
        switch typeOfrequest {
            //MARK: - Users
        case .createUser:
            res = url + userPath + "create"
        case .readUser:
            res = url + userPath + "get_all"
        case .getUserTeams:
            if typeOfParam == .userId{
                if let corParam = param?.first{
                    res = url + userPath + corParam
                }
            }
        case .readUserByEmail:
            if typeOfParam == .email{
                if let corParam = param?.first{
                    res = url + userPath + "/get_by_email/" + corParam
                }
            }
            
        case .authUser:
            if typeOfParam == .authData{
                if let corParam = param{
                    if corParam.count == 2 {
                        res = url + userPath + "auth/" + corParam[0] + "/" + corParam[1]
                    }
                }
            }
            //MARK: - Teams
        case .createTeamForUser:
            if typeOfParam == .userId{
                if let corParam = param?.first{
                    res = url + teamPath + "create/" + corParam
                }
            }
        case .getAllTeams:
            res = url + teamPath + "get_all"
        case .getTeamPlayers:
            if typeOfParam == .teamId{
                if let corParam = param?.first{
                    res = url + teamPath + corParam
                }
            }
            //MARK: - Players
        case .createPlayerForTeam:
            if typeOfParam == .teamId{
                if let corParam = param?.first{
                    res = url + playerPath + "create/" + corParam
                }
            }
        case .getAllPlayers:
            res = url + playerPath + "get_all"
            //MARK: - Games
        case .createGame:
            if typeOfParam == .userId{
                if let corParam = param?.first{
                    res = url + gamePath + "create/" + corParam
                }
            }
        case .getAllGames:
            res = url + gamePath + "get_all"
        case .getGameById:
            if typeOfParam == .gameId{
                if let corParam = param?.first{
                    res = url + gamePath + corParam
                }
            }
        case .getUserGames:
            if typeOfParam == .userId{
                if let corParam = param?.first{
                    res = url + gamePath + "user/" + corParam
                }
            }
        }
        return res
    }
    
}
