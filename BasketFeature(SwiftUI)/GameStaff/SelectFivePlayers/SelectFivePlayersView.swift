//
//  SelectFivePlayersView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import SwiftUI

struct SelectFivePlayersView: View {
   @StateObject var viewModel = SelectFivePlayersViewModel()
    var body: some View {
        VStack{
            Text("Название команды")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical)
            UnselectedPlayersGrid
            Divider()
                .frame(height: 3)
                .overlay(Color.orange)
                .padding(.horizontal)
            Spacer()
            SelectedPlayersGrid
            Spacer()
            
            
        }
        
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
                            Text("\(item)")
                                .padding()
                        }
                    }
                }
            }
        }
    }
    
    var SelectedPlayersGrid: some View{
        HStack{
            ForEach(viewModel.selectedPLayers, id: \.self) { item in
                Button {
                    viewModel.unselectPlayer(number: item)
                } label: {
                    Text("\(item)")
                        .padding()
                }
            }
            
        }
    }
    
    
}

struct SelectFivePlayersView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SelectFivePlayersView()
        }
    }
}
