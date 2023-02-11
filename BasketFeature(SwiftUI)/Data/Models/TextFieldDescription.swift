//
//  TextFieldDescription.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import Foundation
import SwiftUI

struct TextFieldDescription: Identifiable{
    
    var id = UUID()
    var fieldValue = ""{
        didSet{
            visibleOfError = false
        }
    }
    var placeholder = ""
    var titleOfError = ""
    var borderColor = Color.appGray
    var titleColor = Color.black
    var visibleOfError = false
    
}
