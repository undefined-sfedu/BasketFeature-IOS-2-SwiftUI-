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
                if let _ = UserDataManager.shared.user {
                    CustomTabBar() .preferredColorScheme(.light)
                } else {
                    LoginView().preferredColorScheme(.light)
                }
            }
        }
    }
}
