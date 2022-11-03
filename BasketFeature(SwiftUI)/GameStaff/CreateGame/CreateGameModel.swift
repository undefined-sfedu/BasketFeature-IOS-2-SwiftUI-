//
//  CreateGameModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import Alamofire
import SwiftyJSON

class CreateGameModel{
    var viewModel: CreateGameViewModel? = nil
    private var serverHelper = UrlHelper()
    private var localUser = LocalUser()
    
    func getTeams(){
//        var url = serverHelper.getPath(typeOfrequest: .getUserTeams)
//        url += "\(localUser.getData(typeOfData: .id))"
        let url = serverHelper.getPath(typeOfrequest: .getAllTeams, typeOfParam: .withoutParam, param: nil)
//                print(url)
        AF.request(url).responseJSON { [self] answer in

            guard let corData = answer.data else {return}
            let maybeData = try? JSON(data: corData)
            guard let myData = maybeData else {return}
//            print(myData)
            if answer.response?.statusCode == 200{
                var res = [Team]()
                let teams = myData.arrayValue
                
                for team in teams where team["user_id"].intValue == Int(localUser.getData(typeOfData: .id))!{
                    let name = team["name"].stringValue
                    let id = team["id"].intValue
                    let userId = team["user_id"].intValue
                    let newTeam = Team(backId: id, userId: userId, name: name)
                    let playersFromRequest = team["players"].arrayValue
                    playersFromRequest.forEach { item in
                        let player = Player(serverId: item["id"].intValue, teamId: item["team_id"].intValue, name: item["first_name"].stringValue, lastName: item["last_name"].stringValue, middleName: item["middle_name"].stringValue, number: item["number"].intValue)
                        newTeam.players.append(player)
                    }
                    
                    res.append(newTeam)
                }
                
                viewModel?.updateTeams(team: res.reversed())
            }
        }
        
    }
}
