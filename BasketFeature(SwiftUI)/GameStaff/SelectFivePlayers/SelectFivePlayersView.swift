//
//  SelectFivePlayersView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import SwiftUI

struct SelectFivePlayersView: View {
    @StateObject var viewModel = SelectFivePlayersViewModel()
    @EnvironmentObject var game: Game
    @State var nextView = false
    @State var goToPrepareAnotherTeam = false
    @State var needClearPlayers = true
    var teamA: Bool
    var body: some View {
        VStack{
            NavigationLink(destination: SelectTimeAndTeam().environmentObject(game), isActive: $nextView) {EmptyView()}
            NavigationLink(destination: SelectFivePlayersView(teamA: false).environmentObject(game), isActive: $goToPrepareAnotherTeam) {EmptyView()}
            Text("\(game.getTeam(isTeamA: teamA).name)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical)
            UnselectedPlayersGrid
            Divider()
                .frame(height: 3)
                .overlay(Color.orange)
                .padding(.all)
            Spacer()
            SelectedPlayersGrid
            NextScreenButton
                .padding(.bottom)
                .padding(.horizontal)
            
            
        }
        .onAppear(perform: {

            viewModel.setPlayersFromExistingGame(players: game.getTeam(isTeamA: teamA).selectedPlayers, typeOfPlayers: .selected)
            viewModel.setPlayersFromExistingGame(players: game.getTeam(isTeamA: teamA).players, typeOfPlayers: .unselected)
        })
        
        .onDisappear(perform: {
            if needClearPlayers{
                game.uniteSelectedAndUnselectedPlayersInTeam(isTeamA: teamA)
            }
            needClearPlayers.toggle()
        })
        
        .navigationTitle("Стартовая пятерка")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    
    var UnselectedPlayersGrid: some View{
        VStack{
            ForEach(viewModel.unselectedPLayers, id:\.self) { array in
                HStack{
                    ForEach(array, id: \.self) { item in
                        Button {
                            viewModel.selectPlayer(number: item)
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(.black, lineWidth: 2)
                                .overlay(
                                    Text("\(item)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 24))
                                )
                                .frame(width: UIScreen.main.bounds.width * 0.15,
                                       height: UIScreen.main.bounds.width * 0.15)
                            //                            Text("\(item)")
                            //                                .padding()
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    var SelectedPlayersGrid: some View{
        HStack{
            ForEach(viewModel.selectedPLayers, id: \.self) { item in
                Button {
                    viewModel.unselectPlayer(number: item)
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.customOrange, lineWidth: 2)
                        .overlay(
                            Text("\(item)")
                                .foregroundColor(Color.customOrange)
                                .font(.system(size: 24))
                        )
                        .frame(width: UIScreen.main.bounds.width * 0.15,
                               height: UIScreen.main.bounds.width * 0.15)
                    
                }
            }
            
        }
    }
    
    var NextScreenButton: some View{
        Button {
            if viewModel.selectedPLayers.count >= 5{
                game.getTeam(isTeamA: teamA).setSelectedPlayers(numsOfPlayers: viewModel.selectedPLayers)
                needClearPlayers.toggle()
                if teamA == false{
                    nextView.toggle()
                }
                else{
                    goToPrepareAnotherTeam.toggle()
                }
            }
        } label: {
            Text("Далее")
                .font(.system(size: 24))
                .foregroundColor( viewModel.selectedPLayers.count >= 5 ? .customOrange : .customGray)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        
                        .strokeBorder(viewModel.selectedPLayers.count >= 5 ? Color.customOrange : Color.customGray, lineWidth: 2.5)
                        .background(viewModel.selectedPLayers.count >= 5 ? Color.white.cornerRadius(10) : Color.customGray.opacity(0.3).cornerRadius(10))
                )
        }
        
    }
    
    
}

//struct SelectFivePlayersView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            SelectFivePlayersView()
//        }
//    }
//}
