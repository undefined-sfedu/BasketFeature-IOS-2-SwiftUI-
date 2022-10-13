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
    var arrOfValues = ["1", "2", "3", "4", "ОТ"]
    
    var body: some View {
        
        
        VStack{
            CustomPicker
            HStack {
                Text("Команда")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.black)
                .overlay(
                    Text("Химки")
                        .font(.system(size: 24))
                    
                )
            
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.black)
                .overlay(
                    Text("ЦСКА")
                        .font(.system(size: 24))
                )
            
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
            .fontWeight(.bold)
        
    }
    
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




struct SelectTimeAndTeam_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SelectTimeAndTeam()
        }
    }
}
