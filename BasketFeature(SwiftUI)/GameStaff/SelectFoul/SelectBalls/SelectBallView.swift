//
//  SelectBallView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 19.10.2022.
//

import SwiftUI

struct SelectBallView: View {
    @Environment (\.dismiss) var dismiss
    @Binding var countOfBalls: Int
    @Binding var valueOfShots: [Bool]
    @Binding var showAlert: Bool
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    
                    Spacer()
                    HStack{
                        ForEach(0..<countOfBalls) { i in
                            Button {
                                valueOfShots[i].toggle()
                            } label: {
                                Image("Ball")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(valueOfShots[i] ? .customOrange : .gray)
                                
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
    }
    
    var MainTitle: some View{
        Text("Забитые мячи")
            .font(.system(size: 24))
            .foregroundColor(.black)
            .fontWeight(.medium)
    }
    
    var SendBallsButton: some View{
        Button {
            showAlert.toggle()
            dismiss()
            
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.customOrange, lineWidth: 3)
                .overlay(
                    Text("Засчитать")
                        .foregroundColor(.customOrange)
                        .font(.system(size: 24))
                )
                .frame(height: UIScreen.main.bounds.height * 0.1)
        }
    }
}

struct SelectBallView_Previews: PreviewProvider {
    static var previews: some View {
        //        NavigationView{
        SelectBallView(countOfBalls: .constant(3), valueOfShots: .constant([false,false,false]), showAlert: .constant(false))
        //        }
    }
}
