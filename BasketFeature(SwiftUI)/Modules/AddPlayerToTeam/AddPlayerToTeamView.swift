//
//  AddPlayerToTeamView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 04.10.2022.
//

import SwiftUI

struct AddPlayerToTeamView: View {
    enum IndexesOfDescription: Int{
        case lastName = 0
        case name = 1
        case middleName = 2
        case number = 3
    }
    
    @EnvironmentObject var team: Team
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = AddPlayerToTeamViewModel()
    
    var body: some View {
        VStack{
            //            List(viewModel.textFieldsDescription.indices, id: \.self ){ item in
            //                CustomTextField(description: $viewModel.textFieldsDescription[item])
            //            }.listStyle(.plain)
            ScrollView{
                ForEach(viewModel.textFieldsDescription.indices, id: \.self ){ item in
                    CustomTextField(description: $viewModel.textFieldsDescription[item])
                }
                
                CreateButton
                    .padding()
            }
            
            
        }
        .onReceive(viewModel.viewDismissalModePublisher, perform: { shouldDismiss in
            if shouldDismiss{
                self.dismiss()
            }
        })
        
        .onAppear(perform: {
            //            tabBarConfig.tabBarIsHidden.toggle()
        })
        
        .onDisappear(perform: {
            //            tabBarConfig.tabBarIsHidden.toggle()
        })
        
    }
    
    var CreateButton: some View{
        Button {
            viewModel.addPlayer(teamId: team.backId)
            
        } label: {
            Text("Создать")
                .font(.system(size: 24))
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.appOrange.cornerRadius(10))
        }
    }
    
}

struct AddPlayerToTeam_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerToTeamView()
    }
}
