//
//  Team.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import Foundation
class Team: ObservableObject{
    var backId: Int
    var userId: Int
    var name: String
    var players = [Player]()
    
    init(backId: Int, userId: Int, name: String){
        self.backId = backId
        self.userId = userId
        self.name = name
    }
}
