//
//  ShowTeamView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 04.10.2022.
//

import SwiftUI

struct TeamView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var team: Team
    @EnvironmentObject var tabBarConfig: TabBarConfig
    @StateObject var viewModel = TeamViewModel()
    @State var presentCreatePlayerView = false
    
    // MARK: - Body
    
    var body: some View {
        VStack{
            NavigationLink(destination: AddPlayerToTeamView().environmentObject(team), isActive: $presentCreatePlayerView) {EmptyView()}
            List{
                ForEach(viewModel.players, id: \.self) { item in
                    CustomPlayerCell(name: item.name,
                                     lastName: item.lastName,
                                     number: item.number)
                }
            }.listStyle(.plain)
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(team.name)
        .navigationBarItems(trailing: TrailingItem)
        
        .onAppear {
            viewModel.getPlayers(teamId: team.backId)
            tabBarConfig.tabBarIsHidden = true
        }
        .onDisappear {
            if presentCreatePlayerView == false{
                tabBarConfig.tabBarIsHidden = false
            }
        }
    }
    
    //    var LeadingItem: some View{
    //        Text("\(team.name)")
    //            .font(.largeTitle)
    //            .fontWeight(.bold)
    //    }
    
    // MARK: - Custom Views
    
    var TrailingItem: some View {
        Button {
            presentCreatePlayerView.toggle()
        } label: {
            Image(systemName: "plus")
                .foregroundColor(.black)
        }
    }
    
}

// MARK: - Preview Provider

struct ShowTeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
