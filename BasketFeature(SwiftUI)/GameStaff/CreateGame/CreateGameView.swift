//
//  CreateGameView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import SwiftUI

struct CreateGameView: View {
    @EnvironmentObject var tabBarConfig: TabBarConfig
    @State var presentListA = false
    @State var presentListB = false
    @State var presentDatePicker = false
    @StateObject var viewModel = CreateGameViewModel()
    @State var titleOfAHeader = "Выберите команду А"
    @State var titleOfBHeader = "Выберите команду B"
    @State var titleOfDatePicker = "Дата"
    @State var selectedDate = Date()
    @State var endDate = Date()
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter
        
    }
    var body: some View {
        VStack{
        ScrollView {
            Section(header: selectTeamA) {
                if presentListA{
                    VStack {
                        ScrollView(showsIndicators: false){
                            ForEach(viewModel.teamsName, id: \.self) { item in
                                Text("\(item)")
                                    .frame(maxWidth: .infinity)
                                    .padding(.bottom)
                                    .onTapGesture {
                                        titleOfAHeader = "\(item)"
                                        withAnimation(.easeInOut) {
                                            presentListA.toggle()
                                        }
                                    }
                            }
                        }
                    }
                }
                
            }
            .padding(.bottom)
            
            
            Section(header: selectTeamB) {
                if presentListB{
                    VStack {
                        ScrollView(showsIndicators: false){
                            ForEach(viewModel.teamsName, id: \.self) { item in
                                Text("\(item)")
                                    .frame(maxWidth: .infinity)
                                
                                    .padding(.bottom)
                                    .onTapGesture {
                                        titleOfBHeader = "\(item)"
                                        withAnimation(.spring()) {
                                            presentListB.toggle()
                                        }
                                    }
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
            datePickerButton
            if presentDatePicker{
                DatePicker("Дата", selection: $selectedDate, in: ...endDate, displayedComponents: [.date])
                    .datePickerStyle(.wheel)
                    .frame(maxWidth: 100)
                    
                    
            }
            
            
            
            //                }
            Spacer()
            nextScreenButton
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
        .onAppear(perform: {
            tabBarConfig.tabBarIsHidden = true
        })
        .onDisappear(perform: {
            tabBarConfig.tabBarIsHidden = false
        })
        
        //        }
        
        .navigationBarTitle("Новая игра")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var selectTeamA: some View{
        Button {
            withAnimation(.easeIn) {
                presentListA.toggle()
                
            }
            
        } label: {
            HStack{
                Text(titleOfAHeader)
                    .foregroundColor(titleOfAHeader == "Выберите команду А" ? .customGray : .black)
                Spacer()
                Image(systemName: "chevron.backward")
                    .foregroundColor(titleOfBHeader == "Выберите команду B" ? .customGray : .black)
                    .rotationEffect(Angle(degrees: presentListA ? -90 : 0))
            }
            .foregroundColor(.black)
            .padding()
            
            .background(RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.customGray)
            )
            
        }
    }
    
    var selectTeamB: some View{
        
        Button {
            withAnimation(.easeIn) {
                presentListB.toggle()
            }
        } label: {
            HStack{
                Text(titleOfBHeader)
                
                    .foregroundColor(titleOfBHeader == "Выберите команду B" ? .customGray : .black)
                Spacer()
                Image(systemName: "chevron.backward")
                    .foregroundColor(titleOfBHeader == "Выберите команду B" ? .customGray : .black)
                    .rotationEffect(Angle(degrees: presentListB ? -90 : 0))
            }
            .foregroundColor(.black)
            .padding()
            
            .background(RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.customGray)
            )
            
        }
    }
    
    var datePickerButton: some View{
        
        Button {
            withAnimation(.easeIn) {
                print(selectedDate.description)
                presentDatePicker.toggle()
                if presentDatePicker == false{
                    titleOfDatePicker = dateFormatter.string(from: selectedDate)
                }
            }
        } label: {
            HStack{
                Text(titleOfDatePicker)
                
                    .foregroundColor(titleOfDatePicker == "Дата" ? .customGray : .black)
                Spacer()
                Image(systemName: "chevron.backward")
                    .foregroundColor(titleOfDatePicker == "Дата" ? .customGray : .black)
                    .rotationEffect(Angle(degrees: presentDatePicker ? -90 : 0))
            }
            .foregroundColor(.black)
            .padding()
            
            .background(RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.customGray)
            )
            
        }
    }
    
    var nextScreenButton: some View{
        Button {
            print()
        } label: {
            Text("Далее")
                .font(.system(size: 24))
                .foregroundColor(.customOrange)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.customOrange, lineWidth: 2.5)
                )
        }
        
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CreateGameView()
        }
    }
}
