//
//  SelectFivePlayersViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import Foundation
import SwiftUI
class SelectFivePlayersViewModel: ObservableObject{
//    @Published var unselectedPLayers = [
//        PlayerArrayModel(value: [PlayerModel(value: 0), PlayerModel(value: 7), PlayerModel(value: 9), PlayerModel(value: 10), PlayerModel(value: 11)]),
//        PlayerArrayModel(value: [PlayerModel(value: 25), PlayerModel(value: 31), PlayerModel(value: 41), PlayerModel(value: 43), PlayerModel(value: 54)]),
//        PlayerArrayModel(value: [PlayerModel(value: 65), PlayerModel(value: 70), PlayerModel(value: 71), PlayerModel(value: 89)])
//    ]
        @Published var unselectedPLayers = [
            [0,7,9,10,11],
            [25,31,41,43,54],
            [65,70,71,89]
        ]
    @Published var countOfSelectedPlayers = 0
//    @Published var selectedPLayers: PlayerArrayModel = PlayerArrayModel(value: [PlayerModel]()){
    @Published var selectedPLayers = [Int](){
        didSet{
            countOfSelectedPlayers = selectedPLayers.count
        }
    }
    private var indexesOfLastSelectedPlayer = (i:0,j:0)
    private let countOfPlayerInOneRow = 5
    
    func selectPlayer(number: Int){
        var flag = true
        for i in unselectedPLayers.indices{
            for j in unselectedPLayers[i].indices{
                if unselectedPLayers[i][j] == number{
                    if selectedPLayers.count < countOfPlayerInOneRow{
                        indexesOfLastSelectedPlayer = (i,j)
                        selectedPLayers.append(unselectedPLayers[i][j])
                        break
                    }
                    else{
                        flag.toggle()
                        break
                    }
                }
            }
            
        }
        if flag{
            setTeamAfterAddingPlayersArray()
            printData()
            
        }
    }
    
    func unselectPlayer(number: Int){
        //        var indexOfPlayer = 0
        for i in selectedPLayers.indices{
            if selectedPLayers[i] == number{
                selectedPLayers.remove(at: i)
                break
            }
        }
        
        if unselectedPLayers.last?.count == countOfPlayerInOneRow{
//            unselectedPLayers.append(PlayerArrayModel(value:[PlayerModel(value: number)]))
            unselectedPLayers.append([number])
            //            unselectedPLayers.
            print("Count of selected players \(selectedPLayers.count)")
        }
        else{
            var i = unselectedPLayers.count-1
            unselectedPLayers[i].append(number)
        }
        
    }
    
    func setTeamAfterAddingPlayersArray(){
        // check on empty array(i mean that one of unselected array's can have 4 and less player and i must update unselected players to array of arrays where only last array can has 4 and less player)
        //        if unselectedPLayers.last!.count < countOfPlayerInOneRow{
        //            flag.toggle()
        //
        //        }
        
        //        if flag == false{
        
        
        for i in indexesOfLastSelectedPlayer.i...unselectedPLayers.count-1{
            if i == indexesOfLastSelectedPlayer.i{
                unselectedPLayers[i].remove(at: indexesOfLastSelectedPlayer.j)
                
            }
            else{
                unselectedPLayers[i].removeFirst()
            }
            if i < unselectedPLayers.count-1{
                unselectedPLayers[i].append(unselectedPLayers[i+1].first!)
            }
        }
        
        if unselectedPLayers.last!.isEmpty{
            unselectedPLayers.removeLast()
        }
        //        }
        // fill empty place after removing
    }
    
    func printData(){
        print("Unselected players:")
        
        unselectedPLayers.forEach { item in
            var res = ""
            item.forEach { subItem in
                res += "\(subItem), "
            }
            print(res)
        }
        
        print("Selected players:")
        var res = ""
        selectedPLayers.forEach { item in
            res += "\(item), "
        }
        print(res)
        print("Count of selected players \(selectedPLayers.count)")
    }
    
    struct PlayerModel: Identifiable, Hashable{
        var id = UUID()
        var value: Int
    }
    
    struct PlayerArrayModel: Identifiable, Hashable{
        var id = UUID()
        var value: [PlayerModel]
    }
    
}
