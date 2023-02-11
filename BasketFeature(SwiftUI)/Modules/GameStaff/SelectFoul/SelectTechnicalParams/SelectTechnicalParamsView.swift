//
//  SelectTechnicalParamsView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 19.10.2022.
//

import SwiftUI

struct SelectTechnicalParamsView: View {
    private enum TypeOfView: Int{
        case selectTeam = 0
        case selectPlayer
        case selectResult
    }
    
    @Binding var showAlert: Bool
    @State private var currentView = TypeOfView.selectTeam
    @Environment (\.dismiss) var dismiss
    @State var titles = ["Какой команде фол", "Игрок на штрафной", "Результат броска"]
    @State var indexOfSelectedTitles = 0{
        didSet{
            if let saveCurrentView = TypeOfView.init(rawValue: indexOfSelectedTitles){
                currentView = saveCurrentView
            }
        }
    }
    @State var teamNames = ["Химки", "ЦСКА"]
    @State var players = ["0", "25", "31", "41", "43"]
    @State var resOfShot = ["Попадание","Промах"]
    
    var body: some View {
        NavigationView {
            VStack{
                switch currentView {
                case .selectTeam:
                    SelectTeam
                case .selectPlayer:
                    SelectPlayer
                case .selectResult:
                    SelectResultOfShot
                }
    //            if currentView == .selectTeam{
    //                SelectTeam
    //            }
    //            else if currentView == .selectPlayer{
    //                SelectPlayer
    //            }
    //            else {
    //                SelectResultOfShot
    //            }
            }
                .navigationBarItems(leading: MainTitle)
                .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
            
    }
    
    var MainTitle: some View{
        Text(titles[indexOfSelectedTitles])
            .font(.system(size: 24))
            .foregroundColor(.black)
            .fontWeight(.medium)
    }
    
    var SelectTeam: some View{
        VStack{
            ForEach(teamNames.indices) { i in
                Button {
                    indexOfSelectedTitles += 1
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black)
                        .overlay(
                            Text(teamNames[i])
                                .foregroundColor(.black)
                                .font(.system(size: 24))
                        )
                }

                    
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    var SelectPlayer: some View{
        HStack{
            ForEach(0..<players.count) { i in
                Button {
                    indexOfSelectedTitles += 1
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black)
                        .frame(height: UIScreen.main.bounds.height * 0.1)
                        .overlay(
                            Text(players[i])
                                .foregroundColor(.black)
                                .font(.system(size: 24))
                        )
                }
            }
        }
        .padding(.horizontal)
    }
    var SelectResultOfShot: some View{
        VStack{
            
            ForEach(0..<resOfShot.count) { i in
                Button {
                    showAlert.toggle()
                    dismiss()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black)
                        .overlay(
                            Text(resOfShot[i])
                                .foregroundColor(.black)
                                .font(.system(size: 24))
                        )
                }

                
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

struct SelectTechnicalParamsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SelectTechnicalParamsView(showAlert: .constant(false))
        }
    }
}
