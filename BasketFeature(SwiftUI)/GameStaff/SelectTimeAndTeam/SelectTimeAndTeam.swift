//
//  SelectTimeAndTeam.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 13.10.2022.
//

import SwiftUI

struct SelectTimeAndTeam: View {
    @EnvironmentObject var game: Game
    @State var selectedTime = "1"
    @State var selectedIndex = 0
    @State var nextScreen = false
    @State var showAlert = false
    @State var endGameFlag = false
    var arrOfValues = ["1", "2", "3", "4", "ОТ"]
    
    var body: some View{
        ZStack{
            VStack{
                NavigationLink(destination: SelectBeginningAttackView().environmentObject(game), isActive: $nextScreen) {EmptyView()}
                NavigationLink(destination: CustomTabBar(selectedScreen: 1), isActive: $endGameFlag) {EmptyView()}
                CustomPicker
                HStack {
                    Text("Команда")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                    
                    Spacer()
                }
                TeamAButton
                TeamBButton
                
                HStack{
                    CancelButton
                    TableButton
                }
                Spacer()
                
                
                
            }
            .padding(.horizontal)
            Alert
            
        }
        
        
        .navigationBarItems(leading: MainTitle)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    
    var MainTitle: some View{
        Text("Тайм")
            .font(.system(size: 24))
            .foregroundColor(.black)
            .fontWeight(.medium)
        
    }
    
    //    struct CustomAlert: View {
    //        let size = UIScreen.main.bounds
    //        @Binding var isShow: Bool
    //        var largeTitle: String
    //        var smallTitle: String
    //        var titleButton: String
    //        var selfClosed: Bool
    //        var onDone: () -> Void = {}
    var Alert: some View {
        ZStack {
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Завершить игру?")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .padding(.top)
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Text("Отменить")
                        .font(.system(size: 24))
                        .foregroundColor(.customOrange)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.customOrange, lineWidth: 2)
                                .padding(.horizontal)
                        )
                    
                })
//                .padding(.vertical)
                
                Button(action: {
                    showAlert.toggle()
                    endGameFlag.toggle()
                }, label: {
                    Text("Завершить")
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                        .fontWeight(.medium)
                })
                .padding(.vertical)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            .padding(.horizontal)
            
        } .offset(y: showAlert ? 0 : -UIScreen.main.bounds.height)
            .transition(AnyTransition.opacity.animation(.spring()))
        
        
        
        
        
    }
    
    //    MARK: - TeamA Button
    var TeamAButton: some View{
        Button {
            writeDataOfShot(teamA: true)
            nextScreen.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.black)
                .overlay(
                    Text(game.getTeam(isTeamA: true).name)
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                )
        }
    }
    //    MARK: - TeamB Button
    var TeamBButton: some View{
        Button {
            writeDataOfShot(teamA: false)
            nextScreen.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.black)
                .overlay(
                    Text(game.getTeam(isTeamA: false).name)
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                )
        }
    }
    //    MARK: - Cancel Button
    var CancelButton: some View{
        Button {
            showAlert.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.red, lineWidth: 2)
                .overlay(
                    Image(systemName: "xmark")
                        .renderingMode(.template)
                        .foregroundColor(.red)
                        .font(.system(size: 24))
                )
                .frame(maxHeight: UIScreen.main.bounds.height * 0.15)
        }
        
    }
    //    MARK: - Table Button
    var TableButton: some View{
        Button {
            print()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.customOrange, lineWidth: 2)
                .overlay(
                    Text("Таблица")
                        .foregroundColor(.customOrange)
                        .font(.system(size: 24))
                )
                .frame(maxHeight: UIScreen.main.bounds.height * 0.15)
        }
    }
    
    //    MARK: - Picker
    var CustomPicker: some View{
        HStack{
            ForEach(0..<5) { i in
                Button {
                    selectedIndex = i
                    selectedTime = arrOfValues[i]
                    print("Selected time is \(selectedTime)")
                } label: {
                    Text(arrOfValues[i])
                        .foregroundColor(.black)
                        .padding(.all, UIScreen.main.bounds.width * 0.06)
                    
                    
                    //                        .frame(maxHeight: UIScreen.main.bounds.width * 0.15)
                        .background(
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(i == selectedIndex ? Color.white : Color.clear)
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(i == selectedIndex ? Color.black : Color.clear)
                                
                            }
                        )
                    
                    
                }
                
            }
        }
        .background(Color.customPink)
        .cornerRadius(10)
        
    }
    func writeDataOfShot(teamA: Bool){
        game.currentAction.time = selectedTime
        game.currentAction.team = game.getTeam(isTeamA: teamA).name
    }
}



//    MARK: - Preview Provider
struct SelectTimeAndTeam_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SelectTimeAndTeam()
        }
    }
}
