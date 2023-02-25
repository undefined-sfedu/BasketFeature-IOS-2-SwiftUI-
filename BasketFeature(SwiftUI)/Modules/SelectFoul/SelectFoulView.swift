//
//  SelectFoulView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 19.10.2022.
//

import SwiftUI

struct SelectFoulView: View {
    @EnvironmentObject var game: Game
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = SelectFoulViewModel()
    @State var nextView = false
    
    var body: some View {
        ZStack{
            VStack{
                NavigationLink(destination: SelectTimeAndTeam().environmentObject(game), isActive: $nextView) {EmptyView()}
                ForEach(viewModel.typesOfFoul.indices) { i in
                    Button {
                        writeDataOfAction(typeOfFoul: viewModel.typesOfFoul[i], idOfType: i)
                        viewModel.sendSelectedValue(id: i)
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.black)
                            .overlay(
                                Text(viewModel.typesOfFoul[i])
                                    .foregroundColor(.black)
                                    .font(.system(size: 24))
                            )
                    }
                    .sheet(isPresented: $viewModel.showBallSheet) {
                        SelectBallView(countOfBalls: $viewModel.countOfBalls, valueOfShots: $viewModel.valueOfShots, showAlert: $viewModel.showAlert).environmentObject(game)
                    }
//                    .sheet(isPresented: $viewModel.showTechnicalSheet) {
//                        SelectTechnicalParamsView(showAlert: $viewModel.showAlert)
//                    }
                    

                }
                
                BackButton
            }
            .padding(.horizontal)
            .padding(.bottom)
            .navigationBarItems(leading: MainTitle)
            .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
            CustomAlert(isShow: $viewModel.showAlert, largeTitle: "Готово!", smallTitle: "Действие записано!", titleButton: "Ok", selfClosed: false) {
                nextView.toggle()
            }
        }
    }
    
    func writeDataOfAction(typeOfFoul: String, idOfType: Int){
        if let foul = game.currentAction as? Foul{
            foul.typeOfFoul = typeOfFoul
            if idOfType == SelectFoulViewModel.IndexOfTypesOfFoul.impenetrable.rawValue {
                game.addToListOfAction()
            }
            
        }
        
    }
    
    var MainTitle: some View{
        Text("Фол")
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
}

struct SelectFoulView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        SelectFoulView()
        }
    }
}
