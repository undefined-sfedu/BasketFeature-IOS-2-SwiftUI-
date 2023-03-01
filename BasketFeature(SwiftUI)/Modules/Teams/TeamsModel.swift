//
//  TeamModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import Moya
class TeamsModel {

    // MARK: - Properties
    
    private let userDataManager = UserDataManager.shared

    // MARK: - Methods
    
    func getTeams(completion: @escaping ([Team]) -> ()) {
        RequestManager.shared.request(.getTeams) { [weak self] result in
            switch result {
            case .success(let response):
                print(response.statusCode)
                do {
                    let data = try JSON(data: response.data)
                    if response.statusCode == 200 {
                        let userTeamsJSON = data.arrayValue.filter({ $0["user_id"].intValue == self?.userDataManager.user?.id })
                        let userTeams = userTeamsJSON.map( { Team(backId: $0["id"].intValue, userId: $0["user_id"].intValue, name: $0["name"].stringValue) })

                        completion(userTeams.reversed())
                    }
                } catch {
                    print(self, error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
