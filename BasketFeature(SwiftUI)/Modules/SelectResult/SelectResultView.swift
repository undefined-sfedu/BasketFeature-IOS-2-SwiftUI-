//
//  SelectResultView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 15.10.2022.
//

import SwiftUI

struct SelectResultView: View {
    @EnvironmentObject var game: Game
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = SelectResultViewModel()
    @State var nextScreen = false
    @State var idOfSelected = 0
    var body: some View {
        VStack{
            NavigationLink(destination: viewModel.getNextView(id: idOfSelected).environmentObject(game), isActive: $nextScreen) {EmptyView()}
            ForEach(viewModel.typesOfRes.indices) { i in
                Button {
                    idOfSelected = i
                    changeTypeOfAction()
                    nextScreen.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black)
                        .overlay(
                            Text(viewModel.typesOfRes[i])
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
        Text("Результат")
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
    
    func changeTypeOfAction(){
        var typeAction = SelectResultViewModel.IndexOfTypesOfRes.init(rawValue: idOfSelected)!
        switch typeAction {
        case .foul:
            game.currentAction = Foul(action: game.currentAction)
        case .shot:
            game.currentAction = Shot(action: game.currentAction)
        case .loss:
            game.currentAction = Loss(action: game.currentAction)
        }
    }
}

struct SelectResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SelectResultView()
        }
    }
}
