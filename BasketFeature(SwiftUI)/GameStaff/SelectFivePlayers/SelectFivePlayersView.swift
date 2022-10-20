//
//  SelectFivePlayersView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 07.10.2022.
//

import SwiftUI

struct SelectFivePlayersView: View {
   @StateObject var viewModel = SelectFivePlayersViewModel()
    @State var nextView = false
    var body: some View {
        VStack{
            NavigationLink(destination: SelectTimeAndTeam(), isActive: $nextView) {EmptyView()}
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
            NextScreenButton
                .padding(.bottom)
                .padding(.horizontal)
            
            
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
            nextView.toggle()
        } label: {
            Text("Далее")
                .font(.system(size: 24))
                .foregroundColor(.customOrange)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.customOrange, lineWidth: 2.5)
                )
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
