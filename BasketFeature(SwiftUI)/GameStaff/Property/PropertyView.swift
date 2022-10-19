//
//  PropertyView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 15.10.2022.
//

import SwiftUI

struct PropertyView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = PropertyViewModel()
    @State var nextScreen = false
    // Picker properties
    @State var selectedTime = "14"
    @State var selectedIndex = 1
    var arrOfValues = [14.0, 24.0]
    // Select player properties
    @State var players = ["0", "25", "31", "41", "43"]
    @State var selectedPlayer = ""
    @State var selectedPlayers = []
    var body: some View {
        VStack{
            VStack{
                NavigationLink(destination: SelectTypeOfAttackView(), isActive: $nextScreen) {EmptyView()}
                BackButton
                    .padding(.bottom)
            }
            
            CustomPicker
            HStack {
                Text("Владение мячом")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                Spacer()
            }
            
            HStack{
                ForEach(players, id: \.self) { item in
                    Button {
                        selectedPlayer = item
                        selectedPlayers.append(item)
                        print("Selected Players")
                        print(selectedPlayers)
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(item == selectedPlayer ? Color.customOrange : .black, lineWidth: 2)
                            .overlay(
                                Text(item)
                                    .foregroundColor(item == selectedPlayer ? .customOrange :.black)
                                    .font(.system(size: 24))
                            )
                            .frame(maxHeight: UIScreen.main.bounds.height * 0.14)
                    }
                    
                }
            }
            Spacer()
            HStack {
                Text("Секунда на табло: \(String(format: "%.0f", viewModel.selectedSecond))")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                Spacer()
            }
            CustomSlider
            Spacer()
            NextViewButton
            Spacer()
        }
        .padding(.horizontal)
        
        .navigationBarItems(leading: MainTitle)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    var MainTitle: some View{
        Text("Владение")
            .font(.system(size: 24))
            .foregroundColor(.black)
            .fontWeight(.medium)
    }
    
    var BackButton: some View{
        Button {
            dismiss()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.customOrange, lineWidth: 3)
                .overlay(
                    Image("Arrow.left")
                        .foregroundColor(.customOrange)
                        .font(.system(size: 24))
                )
                .frame(height: UIScreen.main.bounds.height * 0.1)
        }
    }
        
    var CustomPicker: some View{
        HStack{
            ForEach(0..<2) { i in
                Button {
                    selectedIndex = i
                    viewModel.countOfSeconds = arrOfValues[selectedIndex]
                } label: {
                    
                    Text("\(String(format: "%.0f", arrOfValues[i]))")
                        .foregroundColor(.black)
                        .padding(.all, UIScreen.main.bounds.width * 0.06)
                        .frame(maxWidth: .infinity)
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
    
    var CustomSlider: some View{
        
        Slider(value: $viewModel.selectedSecond, in: 1...viewModel.countOfSeconds, step: 1, label: {
            Text("Label")
        }, minimumValueLabel: {
            Text("1")
        }, maximumValueLabel: {
            Text("\(String(format: "%.0f", viewModel.countOfSeconds))")
        })
        .tint(.customOrange)
    }
    
    var NextViewButton: some View{
        Button {
            nextScreen.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.customOrange, lineWidth: 3)
                .overlay(
                    Text("Ок")
                        .foregroundColor(.customOrange)
                        .font(.system(size: 24))
                )
                .frame(height: UIScreen.main.bounds.height * 0.1)
        }
    }
    
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PropertyView()
        }
    }
}