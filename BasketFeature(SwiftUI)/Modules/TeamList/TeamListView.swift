//
//  TeamView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import SwiftUI

struct TeamListView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel = TeamListViewModel()
    @EnvironmentObject var tabBarConfig: TabBarConfig
    @State var addTeamCondition = false
    @State var showTeam = false
    @State var idOfSelectedTeam = 0
    //    @Binding var tabBarIsActive: Bool
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddTeamView(), isActive: $addTeamCondition) { EmptyView() }
                if viewModel.teams.isEmpty == false {
                    NavigationLink(destination: TeamView().environmentObject(viewModel.teams[idOfSelectedTeam]), isActive: $showTeam) { EmptyView() }
                    List {
                        ForEach(0..<viewModel.teams.count) { item in
                            Button {
                                idOfSelectedTeam = item
                                showTeam.toggle()
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder()
                                    .frame(height: UIScreen.main.bounds.height * 0.1)
                                    .overlay {
                                        HStack{
                                            Text("\(viewModel.teams[item].name)")
                                            Spacer()
                                        }
                                        .padding(.leading)
                                    }
                            }
                            
                        }
                    }.listStyle(.plain)
                        .refreshable {
                            viewModel.getTeams()
                        }
                }
                else{
                    Text("Создайте команду")
                        .foregroundColor(viewModel.teams.isEmpty ? .white : .appGray)
                    Spacer()
                }
            }
            .navigationBarItems(leading: LeadingItem,
                                trailing: TrailingItem)
        }
        
        
        
    }
        
    // MARK: - Custom Views
    
    var LeadingItem: some View {
        Text("Команды")
            .font(.system(size: 24))
            .fontWeight(.bold)
    }
    
    var TrailingItem: some View {
        NavigationLink(destination: AddTeamView(),
                       label: {
            Image(systemName: "plus")
                .foregroundColor(.black)
            
        })
        //        Button {
        //            addTeamCondition.toggle()
        //        } label: {
        //            Image(systemName: "plus")
        //                .foregroundColor(.black)
        //        }
        
    }
}

// MARK: - Preview Provider

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        //        TeamsView(tabBarIsActive: .constant(true))
        TeamListView()
    }
}
