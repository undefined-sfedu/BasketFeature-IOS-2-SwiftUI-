//
//  AddTeamView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import SwiftUI

struct AddTeamView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel = AddTeamViewModel()
    @EnvironmentObject var teamViewConfig: TeamListViewModel
    @EnvironmentObject var tabBarConfig: TabBarConfig
    
    @Environment (\.dismiss) var dismiss
    
    // MARK: - Body
    
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
            if shouldDismiss {
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
    
    // MARK: - Custom Views
    
    var TrailingItem: some View {
        Button {
            viewModel.createTeam()
        } label: {
            Text("Создать")
        }
        
    }
    var CustomSlider: some View {
        Slider(value: $viewModel.countOfPlayers, in: 5...15, step: 1) {
            Text("Label")
        } minimumValueLabel: {
            Text("5")
        } maximumValueLabel: {
            Text("15")
        }
        .tint(.appOrange)
    }
    
    
}

// MARK: - Preview Provider

struct AddTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AddTeamView()
    }
}
