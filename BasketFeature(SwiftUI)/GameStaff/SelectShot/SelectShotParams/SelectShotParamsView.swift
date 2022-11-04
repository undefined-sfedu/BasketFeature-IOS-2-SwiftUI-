//
//  SelectShotParams.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 20.10.2022.
//

import SwiftUI

struct SelectShotParamsView: View {
    @EnvironmentObject var game: Game
    private enum TypeOfView: Int{
        case selectZone = 0
        case selectResult
        case selectAssist
    }
    @State var selectedZone = -1
    @Binding var showAlert: Bool
    @State private var currentView = TypeOfView.selectZone
    @Environment (\.dismiss) var dismiss
    @State var titles = ["Выберите зону", "Результат броска", "Ассист"]
    @State var resOfShot = ["Попадание","Промах"]
    @State var resOfAssist = ["Да","Нет"]
    @State var indexOfSelectedTitles = 0{
        didSet{
            if let saveCurrentView = TypeOfView.init(rawValue: indexOfSelectedTitles){
                currentView = saveCurrentView
            }
        }
    }
    var body: some View {
        NavigationView {
            VStack{
                switch currentView {
                case .selectZone:
                    VStack{
                    Field(selectedZone: $selectedZone)
                        ContinueButton
                            .padding(.horizontal)
                            .padding(.bottom)
                    }
                case .selectResult:
                    SelectResultOfShot
                case .selectAssist:
                    SelectResultOfAssist
                }
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
    
    var ContinueButton: some View{
        Button {
            indexOfSelectedTitles += 1
            if let shot = game.currentAction as? Shot{
                shot.numberOfZone = selectedZone + 1
            }
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.customOrange, lineWidth: 3)
                .overlay(
                    Image("Arrow.left")
                        .rotationEffect(.degrees(180))
                        .foregroundColor(.customOrange)
                        .font(.system(size: 24))
                )
                .frame(height: UIScreen.main.bounds.height * 0.1)
        }
    }
    
    var SelectResultOfShot: some View{
        VStack{
            
            ForEach(0..<resOfShot.count) { i in
                Button {
                    indexOfSelectedTitles += 1
                    if let shot = game.currentAction as? Shot{
                        shot.resultOfShot = resOfShot[i]
                    }
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
    
    var SelectResultOfAssist: some View{
        VStack{
            
            ForEach(0..<resOfShot.count) { i in
                Button {
                    if let shot = game.currentAction as? Shot{
                        print(resOfAssist[i].lowercased() == "да")
                        shot.assist = (resOfAssist[i].lowercased() == "да" ? true : false)
                        game.addToListOfAction()
                    }
                    showAlert.toggle()
                    
                    dismiss()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black)
                        .overlay(
                            Text(resOfAssist[i])
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

struct SelectShotParamsView_Previews: PreviewProvider {
    static var previews: some View {
        SelectShotParamsView(showAlert: .constant(false))
    }
}
