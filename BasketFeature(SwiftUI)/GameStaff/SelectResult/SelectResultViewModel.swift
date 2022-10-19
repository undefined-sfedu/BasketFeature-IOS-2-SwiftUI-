//
//  SelectResultViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 15.10.2022.
//

import Foundation
import SwiftUI
class SelectResultViewModel: ObservableObject{
    enum IndexOfTypesOfRes: Int{
        case foul = 0
        case shot
        case loss
    }
    let typesOfRes = [
        "Фол",
        "Бросок",
        "Потеря"
    ]
    
   @ViewBuilder func getNextView(id:Int) -> some View{
        
        let index = IndexOfTypesOfRes.init(rawValue: id)!
        switch index{
        case .foul:
            Text("Foul")
        case .shot:
            Text("Shot")
        case .loss:
            SelectLossView()
        }
    }
    
}
