//
//  TextFieldDescription.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import Foundation
import SwiftUI

struct TextFieldModel: Identifiable{
    
    var id = UUID()
    var fieldValue = "" {
        didSet{
            visibleOfError = false
        }
    }
    
    var placeholder: String
    var titleOfError: String
    var visibleOfError = false
}
