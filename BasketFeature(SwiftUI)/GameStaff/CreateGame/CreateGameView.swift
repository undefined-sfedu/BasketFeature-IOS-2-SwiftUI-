//
//  CreateGameView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 06.10.2022.
//

import SwiftUI

struct CreateGameView: View {
    @State var presentList = false
    @State var presentListB = false
    @State var titleOfAHeader = "Выберите команду А"
    @State var titleOfBHeader = "Выберите команду B"
    var body: some View {
        
        NavigationView {
            HStack {
                ScrollView{
                    Section(header: selectTeamA) {
                        if presentList{
                            VStack{
                                ForEach(0..<13) { i in
                                        
                                    Text("\(i)")
                                        .frame(maxWidth: .infinity)
                                        .background(Color.red)
                                        .padding(.bottom)
                                        .onTapGesture {
                                            titleOfAHeader = "\(i)"
                                            withAnimation(.spring()) {
                                                presentList.toggle()
                                            }
                                        }
                                }
                            }
                        }
                        
                    }
                    .padding(.bottom)
                    
                    
                    Section(header: selectTeamB) {
                        if presentListB{
                            VStack{
                                ForEach(0..<13) { i in
                                    
                                    Text("\(i)")
                                        .frame(maxWidth: .infinity)
                                        .background(Color.red)
                                        .padding(.bottom)
                                        .onTapGesture {
                                            titleOfBHeader = "\(i)"
                                            withAnimation(.easeIn) {
                                                presentListB.toggle()
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        
        //        LazyVStack(pinnedViews:
        //        ){
        //
        //        }
    }
    
    var selectTeamA: some View{
        Button {
            withAnimation(.easeIn) {
                presentList.toggle()
            }
        } label: {
            HStack{
                Text(titleOfAHeader)
                    
                Spacer()
                Image(systemName: "chevron.backward")
                    .rotationEffect(Angle(degrees: presentList ? -90 : 0))
            }
            .foregroundColor(.black)
            .padding()
            
            .background(RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.black)
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
                Spacer()
                Image(systemName: "chevron.backward")
                    .rotationEffect(Angle(degrees: presentListB ? -90 : 0))
            }
        }
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView()
    }
}
