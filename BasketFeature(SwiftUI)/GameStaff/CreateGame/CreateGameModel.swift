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
    private var serverHelper = ServerHelper()
    private var localUser = LocalUser()
    
    func getTeams(){
        var url = serverHelper.getPath(typeOfrequest: .getUserTeams)
        url += "\(localUser.getData(typeOfData: .id))"
        //        print(url)
        AF.request(url).responseJSON { [self] answer in

            guard let corData = answer.data else {return}
            let maybeData = try? JSON(data: corData)
            guard let myData = maybeData else {return}
//            print(myData)
            if answer.response?.statusCode == 200{
                var res = [Team]()
                let teams = myData["teams"].arrayValue
                
                teams.forEach { item in
                    let name = item["name"].stringValue
                    let id = item["id"].intValue
                    let userId = item["user_id"].intValue
                    let team = Team(backId: id, userId: userId, name: name)
                    res.append(team)
                }
                viewModel?.updateTeams(team: res.reversed())
            }
        }
        
    }
}
