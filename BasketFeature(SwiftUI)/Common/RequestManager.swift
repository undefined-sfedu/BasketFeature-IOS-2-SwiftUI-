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
    
    case register(email: String, password: String)
    case logIn(email: String, password: String)
    case getTeams
}


extension RequestManager: TargetType {
    var baseURL: URL {
        return URL(string: "http://85.193.83.34:8000")!
    }
    
    var path: String {
        switch self {
        case .register:
            return RequestManager.userPath + "/create"
        case .logIn(let email, let password):
            return RequestManager.userPath + "/auth/\(email)/\(password)"
        case .getTeams:
            return RequestManager.teamPath + "/get_all"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .register:
            return .post
        case .logIn, .getTeams:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .register:
            return .requestParameters(parameters: parameters!, encoding: JSONEncoding.default)
        case .logIn, .getTeams:
            return .requestPlain
            
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case.register(let email, let password):
            return ["email": email, "password": password]
        case .logIn, .getTeams:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .register:
            return nil
        case .logIn, .getTeams:
            return ["accept": "application/json"]
        }
    }
    
}

extension RequestManager {
    static let shared = MoyaProvider<RequestManager>()
}
