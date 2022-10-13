//
//  AddPlayerToTeamModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import Foundation
import SwiftyJSON
import Alamofire

class AddPlayerToTeamModel{
    private let serverHelper = ServerHelper()
    private let localUser = LocalUser()
    var viewModel: AddPlayerToTeamViewModel? = nil
    
    func addPlayersToTeam(teamId: Int, player: Player){
//        var url = serverHelper.getPath(typeOfrequest: .createPlayerForTeam)
        let url = serverHelper.getPath(typeOfrequest: .createPlayerForTeam, typeOfParam: .teamId, param: ["\(teamId)"])
//        url += "\(teamId)/players"
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        let body = ["number": player.number]
        print(url)
        AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseJSON { [self] answer in
            guard let corData = answer.data else {return}
            let maybeData = try? JSON(data: corData)
            guard let myData = maybeData else {return}
            print(answer.response?.statusCode)
            print(myData)
            if answer.response?.statusCode == 200{
                viewModel?.updateView()
            }
            
        }
        
    }
}
