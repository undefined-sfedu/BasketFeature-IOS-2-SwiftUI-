//
//  SelectFivePlayersViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import Foundation
import SwiftUI
class SelectFivePlayersViewModel: ObservableObject{
    
    enum TypeOfPlayers{
        case selected
        case unselected
    }
    
    @Published var unselectedPLayers = [[Int]]()
    @Published var countOfSelectedPlayers = 0
    
    @Published var selectedPLayers = [Int](){
        didSet{
            countOfSelectedPlayers = selectedPLayers.count
        }
    }
    private var indexesOfLastSelectedPlayer = (i:0,j:0)
    private let countOfPlayerInOneRow = 5
    
    func setPlayersFromExistingGame(players: [Player], typeOfPlayers: TypeOfPlayers){
        var count = 0
        var array = [Int]()
        switch typeOfPlayers {
        case .selected:
            selectedPLayers = [Int]()
            for item in players{
                selectedPLayers.append(item.number)
            }
            
        case .unselected:
            unselectedPLayers = [[Int]]()
            for item in players{
                array.append(item.number)
                count += 1
                if count == 5{
                    unselectedPLayers.append(array)
                    count = 0
                    array = [Int]()
                }
            }
            if unselectedPLayers.count > 0{
                unselectedPLayers.append(array)
            }
        }
        
        
        
        print(unselectedPLayers)
    }
    
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
            if i < 0{
                i = 0
                unselectedPLayers.append([Int]())
            }
        
            
            unselectedPLayers[i].append(number)
        }
        
    }
    
    func setTeamAfterAddingPlayersArray(){
        
        
        for i in indexesOfLastSelectedPlayer.i...unselectedPLayers.count-1{
            if i == indexesOfLastSelectedPlayer.i{
                unselectedPLayers[i].remove(at: indexesOfLastSelectedPlayer.j)
                
            }
            else{
                if unselectedPLayers[i].isEmpty == false{
                unselectedPLayers[i].removeFirst()
                }
            }
            
            if i < unselectedPLayers.count-1{
                if let player = unselectedPLayers[i+1].first{
                    unselectedPLayers[i].append(player)
                }
                
            }
        }
        
        if unselectedPLayers.last!.isEmpty{
            unselectedPLayers.removeLast()
        }
        
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
    
    
    
}
