//
//  ServerHelper.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 05.10.2022.
//

import Foundation
struct ServerHelper{
    private let url = "http://127.0.0.1:8000"
    
    enum TypeOfRequest{
        case createUser
        case readUser
        case getUserTeams
        case readUserByEmail
        case authUser
        case createTeamForUser
        case getAllTeams
        case getTeamPlayers
        case createPlayerForTeam
        case getAllPlayers
    }
    
    func getPath(typeOfrequest: TypeOfRequest) -> String{
        var res = ""
        switch typeOfrequest {
        case .createUser:
            res = "/users/create"
        case .readUser:
            res = "/users/get_all"
        case .getUserTeams:
            res = "/users/"
        case .readUserByEmail:
            res = "/users/create"
        case .authUser:
            res = "/users/auth/"
        case .createTeamForUser:
            res = "/users/"
        case .getAllTeams:
            res = "/users/create"
        case .getTeamPlayers:
            res = "/users/create"
        case .createPlayerForTeam:
            res = "/teams/"
        case .getAllPlayers:
            res = "/users/create"
        }
        return url+res
    }
    
}
