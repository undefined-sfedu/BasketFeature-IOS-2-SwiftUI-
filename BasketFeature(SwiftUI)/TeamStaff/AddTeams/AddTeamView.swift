//
//  AddTeamView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import SwiftUI

struct AddTeamView: View {
    @StateObject var viewModel = AddTeamViewModel()
    @EnvironmentObject var teamViewConfig: TeamsViewModel
    @EnvironmentObject var tabBarConfig: TabBarConfig
    
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            CustomTextField(description: $viewModel.teamTextFieldDescription)
            
            Text("Добавить игроков: " + String(format: "%.0f", viewModel.countOfPlayers))
                .padding(.horizontal)
            CustomSlider
                .padding(.horizontal)
            List(viewModel.playersCells.indices, id: \.self ){ item in
                CustomTextField(description: $viewModel.playersCells[item])
                    .keyboardType(.numberPad)
            }
            
            .listStyle(.plain)
            
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Новая команда")
            .navigationBarItems(
                trailing: TrailingItem)
        }
        .onReceive(viewModel.viewDismissalModePublisher, perform: { shouldDismiss in
            if shouldDismiss{
                self.dismiss()
            }
        })
        
        .onAppear() {
            tabBarConfig.tabBarIsHidden = true
        }
        
        .onDisappear() {
            tabBarConfig.tabBarIsHidden = false
        }
        
    }
    var TrailingItem: some View{
        Button {
            viewModel.createTeam()
        } label: {
            Text("Создать")
        }
        
    }
    var CustomSlider: some View{
        Slider(value: $viewModel.countOfPlayers, in: 5...15, step: 1) {
            Text("Label")
        } minimumValueLabel: {
            Text("5")
        } maximumValueLabel: {
            Text("15")
        }
        .tint(.customOrange)
    }
    
    //    var CreateButton: some View{
    //        Button {
    //    viewModel.createTeam()
    //        } label: {
    //            Text("Создать")
    //                .font(.system(size: 24))
    //                .foregroundColor(.black)
    //                .padding(.vertical)
    //                .frame(maxWidth: .infinity)
    //                .background(Color.customOrange.cornerRadius(10))
    //        }
    //
    //    }
    
    
}

struct AddTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AddTeamView()
    }
}
