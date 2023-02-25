//
//  PropertyViewModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 15.10.2022.
//

import Foundation
import SwiftUI
class PropertyViewModel: ObservableObject{
    @Published var countOfSeconds: Double = 24{
        didSet{
            if selectedSecond > countOfSeconds{
                selectedSecond = countOfSeconds
            }
        }
    }
    @Published var selectedSecond: Double = 1
    
}
