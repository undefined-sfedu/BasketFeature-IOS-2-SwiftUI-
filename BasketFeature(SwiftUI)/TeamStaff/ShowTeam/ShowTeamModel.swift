//
//  ShowTeamModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
class ShowTeamModel{
    private var serverHelper = ServerHelper()
    private var localUser = LocalUser()
    var viewModel: ShowTeamViewModel? = nil
    
    func getPlayers(teamId: Int){
        var url = serverHelper.getPath(typeOfrequest: .getUserTeams) + "\(localUser.getData(typeOfData: .id))"
        AF.request(url, method: .get).responseJSON { [self] answer in
            guard let corData = answer.data else {return}
            let maybeData = try? JSON(data: corData)
            guard let myData = maybeData else {return}
            print("\(ShowTeamModel.self).getPlayers(): status code \(answer.response?.statusCode)")
            if answer.response?.statusCode == 200{
                var players = [Player]()
                for team in myData["teams"].arrayValue where team["id"].intValue == teamId
                {
                    team["players"].arrayValue.forEach { item in
                        var player = Player(serverId: item["id"].intValue,
                                            teamId: item["team_id"].intValue,
                                            name: item["first_name"].stringValue,
                                            lastName: item["last_name"].stringValue,
                                            middleName: item["middle_name"].stringValue,
                                            number: item["number"].intValue)
                        players.append(player)
                    }
                }
                
                viewModel?.updatePlayers(newPlayers: players.reversed())
            }
            
        }
    }
}
