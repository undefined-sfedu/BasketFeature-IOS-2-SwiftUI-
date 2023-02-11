//
//  BasketFeature_SwiftUI_App.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import SwiftUI

@main
struct BasketFeature_SwiftUI_App: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                if LocalUser().getData(typeOfData: .id) == "" {
                    LoginView().preferredColorScheme(.light)
                }
                else{
                    CustomTabBar() .preferredColorScheme(.light)
                }
            }
        }
    }
}
