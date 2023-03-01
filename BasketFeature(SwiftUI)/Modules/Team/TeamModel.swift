//
//  ShowTeamModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import SwiftyJSON

class TeamModel {
    var viewModel: TeamViewModel? = nil
    
    private let userDataManager = UserDataManager.shared
    
    func getPlayers(teamId: Int, completion: @escaping ([Player]) -> ()) {
        guard let userId = userDataManager.user?.id else { return }
        RequestManager.shared.request(.getUserTeams(userId: userId)) { result in
            switch result {
            case.success(let response):
                do {
                    let data = try JSON(data: response.data)
                    let userTeam = data["teams"].arrayValue.filter({ $0["id"].intValue == teamId})
                    let players = userTeam[0]["players"].arrayValue.map({
                        Player(serverId: $0["id"].intValue,
                                            teamId: $0["team_id"].intValue,
                                            name: $0["first_name"].stringValue,
                                            lastName: $0["last_name"].stringValue,
                                            middleName: $0["middle_name"].stringValue,
                                            number: $0["number"].intValue)
                    })
                    completion(players.reversed())
                    
                } catch {
                    print(error.localizedDescription)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
