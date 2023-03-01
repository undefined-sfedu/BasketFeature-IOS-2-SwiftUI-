//
//  AddTeamModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import SwiftyJSON
import Alamofire
import Moya

class AddTeamModel {
    
    // MARK: - Properties
    
    private let userDataManager = UserDataManager.shared
    
    // MARK: - Methods
    
    func createTeam(name: String, players: [Int], completion: @escaping () -> ()) {
        guard let id = userDataManager.user?.id else { return }
        RequestManager.shared.request(.createTeamForUser(userId: id, teamName: name)) { [weak self ]result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSON(data: response.data)
                    if response.statusCode == 200 {
                        let teamId = data["id"].intValue
                        self?.addPlayersToTeam(teamId: teamId, players: players, completion: completion)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addPlayersToTeam(teamId: Int, players: [Int], completion: @escaping () ->()) {
        print("Adding players to team...")
        var counter = 0
        players.forEach({
            RequestManager.shared.request(.createPlayerForTeam(playerNumber: $0, teamId: teamId)) { result in
                switch result {
                case .success(let response):
                    print(response.statusCode)
                    counter += 1
                    if counter == players.count {
                        completion()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
    }
}
