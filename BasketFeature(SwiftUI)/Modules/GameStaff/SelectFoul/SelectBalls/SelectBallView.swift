//
//  SelectBallView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 19.10.2022.
//

import SwiftUI

struct SelectBallView: View {
    @EnvironmentObject var game: Game
    @Environment (\.dismiss) var dismiss
    @Binding var countOfBalls: Int
    @Binding var valueOfShots: [Bool]
    @Binding var showAlert: Bool
    @State var currentValueOfShots = [Bool]()
    
    
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    
                    Spacer()
                    HStack{
                        
                        
                        
                        //                        ForEach(valueOfShots.indices) { i in
                        //                            Text(valueOfShots[i].description)
                        //                        }
                        
                        ForEach(valueOfShots.indices) { i in
                            //                        ForEach(0..<countOfBalls, id: \.self) { i in
                            Button {
                                valueOfShots[i].toggle()
                                //                                item.toggle()
                            } label: {
                                Image("Ball")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor( valueOfShots[i] ? .appOrange : .gray)
                                
                                    .frame(width: UIScreen.main.bounds.width * 0.25,
                                           height: UIScreen.main.bounds.width * 0.25)
                                    .aspectRatio(contentMode: .fill)
                            }
                        }
                    }
                    Spacer()
                    SendBallsButton
                }
                
            }
            
            .padding(.horizontal)
            .padding(.bottom)
            .navigationBarItems(leading: MainTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
        .onAppear {
            print(valueOfShots)
        }
    }
    
    var MainTitle: some View{
        Text("Забитые мячи")
            .font(.system(size: 24))
            .foregroundColor(.black)
            .fontWeight(.medium)
        
    }
    
    var SendBallsButton: some View{
        Button {
            if let foul = game.currentAction as? Foul{
                foul.arrayOfShots = valueOfShots
            }
            game.addToListOfAction()
            showAlert.toggle()
            dismiss()
            
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.appOrange, lineWidth: 3)
                .overlay(
                    Text("Засчитать")
                        .foregroundColor(.appOrange)
                        .font(.system(size: 24))
                )
                .frame(height: UIScreen.main.bounds.height * 0.1)
        }
    }
}

//struct SelectBallView_Previews: PreviewProvider {
//    static var previews: some View {
//                NavigationView{
//        SelectBallView(countOfBalls: .constant(3), valueOfShots: .constant([false,false,false]), showAlert: .constant(false))
//                }
//    }
//}
