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
    var selectedPlayers = [Player]()
    
    
    init(backId: Int, userId: Int, name: String){
        self.backId = backId
        self.userId = userId
        self.name = name
    }
    
    func setSelectedPlayers(numsOfPlayers: [Int]){
        // добавить в массив выбранных
        numsOfPlayers.forEach { num in
            for player in players where player.number == num{
                selectedPlayers.append(player)
            }
        }
        // удалить из массива игроков
        var newPlayers = [Player]()
        for player in players where numsOfPlayers.contains(player.number) == false{
            newPlayers.append(player)
        }
        players = newPlayers
    }
    
    func addSelectedPlayerToAllPlayers(){
        selectedPlayers.forEach { item in
            players.append(item)
        }
        selectedPlayers.removeAll()
    }
}
