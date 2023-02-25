//
//  View+Convenience.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 11.02.2023.
//

import Foundation
import SwiftUI

class ViewFactory {
    
    class func defaultLargeButton (_ title: String,
                                    completion: @escaping () -> () ) -> some View {
        
        Button(action: { completion() }) {
            Text(title)
                .font(.system(size: 23))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.appOrange.cornerRadius(10))
        }
    }
    
}
