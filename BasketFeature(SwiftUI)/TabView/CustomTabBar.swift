//
//  CustomTabBar.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import SwiftUI

struct CustomTabBar: View {
    var images = ["Settings", "Ball", "Teams"]
    @State var colorOfImages: [Color] = [.customGray, .customGray, .customOrange]
    @State var selectedScreen: Int = 2{
        didSet{
            colorOfImages = [.customGray, .customGray, .customGray]
            colorOfImages[selectedScreen] = .customOrange
        }
    }
    @State var titlesOfImage = ["Настройки","Игры","Команды"]
    @StateObject var tabBarConfig = TabBarConfig()
    var body: some View {
        VStack{
            if selectedScreen == 0{
                Text("Setting")
            }
            else if selectedScreen == 1{
                GamesView().environmentObject(tabBarConfig)
                    .accentColor(.customOrange)
            }
            else{
//                TeamsView(tabBarIsActive: $tabBarIsHidden)
                TeamsView().environmentObject(tabBarConfig)
                    .accentColor(.customOrange)
            }
            if !tabBarConfig.tabBarIsHidden{
                Spacer()
                HStack{
                    ForEach(0..<3) { i in
                        Spacer()
                        Button {
                            selectedScreen = i
                        } label: {
                            VStack{
                                Image(images[i])

                                    .renderingMode(.template)
                                    .foregroundColor(colorOfImages[i])
                                    .frame(width: UIScreen.main.bounds.height * 0.06, height: UIScreen.main.bounds.height * 0.06)
                                Text(titlesOfImage[i])
                                    .foregroundColor(colorOfImages[i])
                                    .font(.caption)
                            }
                        }
                        Spacer()
                        
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
