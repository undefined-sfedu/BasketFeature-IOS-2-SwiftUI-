////
////  TabView.swift
////  BasketFeature(SwiftUI)
////
////  Created by Daniil on 02.10.2022.
////
//
//import SwiftUI
//
//struct TabBarView: View {
//    init(){
//        
//        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 174/256, green: 174/256, blue: 174/256, alpha: 1)
//        UITabBar.appearance().backgroundColor = .white
//    }
//    @State var selectedItem = 1
//    var body: some View {
//        
//        TabView(selection: $selectedItem){
//            Text("Настройки")
//                .tabItem {
//                    Image("Settings")
//                        .renderingMode(.template)
//                    Text("Настройки")
//                }
//            
//            Text("Игры")
//                .tabItem {
//                    Image("Ball")
//                        .renderingMode(.template)
//                    Text("Игры")
//                }
//            
//            TeamsView()
//                .tabItem {
//                    Image("Teams")
//                        .renderingMode(.template)
//                    Text("Команды")
//                }
//        }.accentColor(.customOrange)
//        
//            .navigationBarBackButtonHidden(true)
//            
//    }
//}
//
//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
