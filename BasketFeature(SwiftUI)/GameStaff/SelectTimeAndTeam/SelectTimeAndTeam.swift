//
//  SelectTimeAndTeam.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 13.10.2022.
//

import SwiftUI

struct SelectTimeAndTeam: View {
    @State var selectedTime = "1"
    @State var selectedIndex = 0
    @State var nextScreen = false
    var arrOfValues = ["1", "2", "3", "4", "ОТ"]
    
    var body: some View{
        VStack{
            NavigationLink(destination: SelectBeginningAttackView(), isActive: $nextScreen) {EmptyView()}
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
        
        .navigationBarItems(leading: MainTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    var MainTitle: some View{
        Text("Тайм")
            .font(.system(size: 24))
            .foregroundColor(.black)
            .fontWeight(.medium)
        
    }
  
    
    //    MARK: - TeamA Button
    var TeamAButton: some View{
        Button {
            
            nextScreen.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.black)
                .overlay(
                    Text("Химки")
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                )
        }
    }
    //    MARK: - TeamB Button
    var TeamBButton: some View{
        Button {
            
            nextScreen.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.black)
                .overlay(
                    Text("ЦСКА")
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                )
        }
    }
    //    MARK: - Cancel Button
    var CancelButton: some View{
        Button {
            print()
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
    
}



//    MARK: - Preview Provider
struct SelectTimeAndTeam_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SelectTimeAndTeam()
        }
    }
}
