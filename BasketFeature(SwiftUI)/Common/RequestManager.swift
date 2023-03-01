//
//  RequestHelper.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 26.02.2023.
//

import Moya

enum RequestManager {
    static private let userPath = "/users"
    static private let teamPath = "/teams"
    static private let createPath = "/create"
    static private let playersPath = "/players"
    
    case register(email: String, password: String)
    case logIn(email: String, password: String)
    case getTeams
    case createTeamForUser(userId: Int, teamName: String)
    case createPlayerForTeam(playerNumber: Int, teamId: Int)
    case getUserTeams(userId: Int)
}


extension RequestManager: TargetType {
    var baseURL: URL {
        return URL(string: "http://85.193.83.34:8000")!
    }
    
    var path: String {
        switch self {
        case .register:
            return RequestManager.userPath + RequestManager.createPath
        case .logIn(let email, let password):
            return RequestManager.userPath + "/auth/\(email)/\(password)"
        case .getTeams:
            return RequestManager.teamPath + "/get_all"
        case .createTeamForUser(let userId, _):
            return RequestManager.teamPath + RequestManager.createPath + "/\(userId)"
        case .createPlayerForTeam(_, let teamId):
            return RequestManager.playersPath + RequestManager.createPath + "/\(teamId)"
        case .getUserTeams(let userId):
            return RequestManager.userPath + "/\(userId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .register, .createTeamForUser, .createPlayerForTeam:
            return .post
        case .logIn, .getTeams, .getUserTeams:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .register, .createTeamForUser, .createPlayerForTeam:
            return .requestParameters(parameters: parameters!, encoding: JSONEncoding.default)
        case .logIn, .getTeams, .getUserTeams:
            return .requestPlain
            
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case.register(let email, let password):
            return ["email": email, "password": password]
        case .createTeamForUser(_, let teamName):
            return ["name": teamName]
        case .createPlayerForTeam(let playerNumber, _):
            return ["number": playerNumber]
        case .logIn, .getTeams, .getUserTeams:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .register, .createTeamForUser, .createPlayerForTeam:
            return nil
        case .logIn, .getTeams, .getUserTeams:
            return ["accept": "application/json"]
        }
    }
    
}

extension RequestManager {
    static let shared = MoyaProvider<RequestManager>()
}
