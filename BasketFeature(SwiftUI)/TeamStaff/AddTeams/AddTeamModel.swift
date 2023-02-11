//
//  AddTeamModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
class AddTeamModel{
    var viewModel: AddTeamViewModel? = nil
    private var serverHelper = UrlHelper()
    private var localUser = LocalUser()
    
    func createTeam(name: String, players: [String]){
//        var url = serverHelper.getPath(typeOfrequest: .createTeamForUser)
//        url += "\(localUser.getData(typeOfData: .id))/teams/"
        let url = serverHelper.getPath(typeOfrequest: .createTeamForUser, typeOfParam: .userId, param: [localUser.getData(typeOfData: .id)])
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        let body = ["name" : name]
        print(name)
        print(url)
        AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseJSON { [self] answer in
            print(answer.response?.statusCode)
//            print(answer)
            guard let corData = answer.data else {return}
            let maybeData = try? JSON(data: corData)
            guard let myData = maybeData else {return}
//            print(myData)
            if answer.response?.statusCode == 200 {
                viewModel?.updateView()
                var teamId = myData["id"].intValue
                addPlayersToTeam(teamId: teamId, players: players)
            }
        }
    }
    
    func addPlayersToTeam(teamId: Int, players: [String]){
//        var url = serverHelper.getPath(typeOfrequest: .createPlayerForTeam)
        let url = serverHelper.getPath(typeOfrequest: .createPlayerForTeam, typeOfParam: .teamId, param: ["\(teamId)"])
        print(url)
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        for number in players{
            let body = ["number": number]
            AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseJSON { answer in
                guard let corData = answer.data else {return}
                let maybeData = try? JSON(data: corData)
                guard let myData = maybeData else {return}
                print(answer.response?.statusCode)
//                print(myData)
            }
        }
    }
}
