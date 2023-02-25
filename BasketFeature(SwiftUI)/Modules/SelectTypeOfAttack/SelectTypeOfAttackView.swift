//
//  SelectTypeOfAttackView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 15.10.2022.
//

import SwiftUI

struct SelectTypeOfAttackView: View {
    @EnvironmentObject var game: Game
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = SelectTypeOfAttackViewModel()
    @State var nextScreen = false
    var body: some View {
        
        
        VStack{
            NavigationLink(destination: SelectResultView().environmentObject(game), isActive: $nextScreen) {EmptyView()}
            ForEach(viewModel.typesOfAttack, id: \.self) { i in
                Button {
                    game.currentAction.typeOfAttack = i
                    printShotData()
                    nextScreen.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black)
                        .overlay(
                            Text(i)
                                .foregroundColor(.black)
                                .font(.system(size: 24))
                        )
                }
            }
            BackButton
        }
        .padding(.horizontal)
        .padding(.bottom)
        .navigationBarItems(leading: MainTitle)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    var MainTitle: some View{
        Text("Тип атаки")
            .font(.system(size: 24))
            .foregroundColor(.black)
            .fontWeight(.medium)
    }
    
    var BackButton: some View{
        Button {
            dismiss()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.appOrange, lineWidth: 3)
                .overlay(
                    Image("Arrow.left")
                        .foregroundColor(.appOrange)
                        .font(.system(size: 24))
                )
                .frame(height: UIScreen.main.bounds.height * 0.1)
        }
    }
    func printShotData(){
        print("---------------------------")
        print("Team - \(game.currentAction.team)")
        print("time of game - \(game.currentAction.time)")
        print("begin of attack - \(game.currentAction.typeOfBeginAttack)")
        print("players - \(game.currentAction.lineOfPlayersInAction)")
        print("time of attack - \(game.currentAction.secondOfAction)")
        print(" type of attack \(game.currentAction.typeOfAttack)")
        print("---------------------------")
    }
}

struct SelectTypeOfAttackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        SelectTypeOfAttackView()
        }
    }
}
