//
//  SelectFoulViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 19.10.2022.
//

import Foundation
import SwiftUI

class SelectFoulViewModel: ObservableObject{
    @Published var showAlert = false
    @Published var countOfBalls = 0
    @Published var showBallSheet = false
    @Published var showImpenetrableSheet = false
    @Published var showTechnicalSheet = false
    @State var valueOfShots = [false, false, false]
    
    enum IndexOfTypesOfFoul: Int{
        case oneShot = 0
        case twoShot
        case threeShot
        case impenetrable // непробивной
        case technical
    }
    var typesOfFoul = [
    "1 бросок",
    "2 бросока",
    "3 бросока",
    "непробивной",
    "технический"
    ]
    
    func sendSelectedValue(id: Int){
        let index = IndexOfTypesOfFoul.init(rawValue: id)!
            switch index {
            case .oneShot:
                countOfBalls = index.rawValue + 1
                showBallSheet.toggle()
            case .twoShot:
                countOfBalls = index.rawValue + 1
                showBallSheet.toggle()
            case .threeShot:
                countOfBalls = index.rawValue + 1
                showBallSheet.toggle()
            case .impenetrable:
                showAlert.toggle()
            case .technical:
                showTechnicalSheet.toggle()
            }
        }
    
    
//    @ViewBuilder func getNextView(id:Int) -> some View{
//
//        let index = IndexOfTypesOfFoul.init(rawValue: id)!
//        switch index {
//        case .oneShot:
//            SelectBallView(countOfBalls: $countOfBalls, valueOfShots: $valueOfShots)
//        case .twoShot:
//            SelectBallView(countOfBalls: $countOfBalls, valueOfShots: $valueOfShots)
//        case .threeShot:
//            SelectBallView(countOfBalls: $countOfBalls, valueOfShots: $valueOfShots)
//        case .impenetrable:
//            Text("asd")
//        case .technical:
//            Text("asd")
//        }
//     }
}
