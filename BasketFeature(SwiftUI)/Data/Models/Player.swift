//
//  Player.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import Foundation
struct Player: Identifiable, Hashable{
    
    var id = UUID()
    var serverId: Int
    var teamId: Int
    var name: String
    var lastName: String
    var middleName: String
    var number: Int
}
