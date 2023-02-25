//
//  SelectShot.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 20.10.2022.
//

import SwiftUI

struct SelectShotView: View {
    @EnvironmentObject var game: Game
    @StateObject var viewModel  = SelectShotViewModel()
    @Environment (\.dismiss) var dismiss
    @State var presentSheet = false
    @State var nextView = false
    @State var showAlert = false
    var body: some View {
        ZStack{
        VStack(alignment: .leading){
            NavigationLink(destination: SelectTimeAndTeam().environmentObject(game), isActive: $nextView) {EmptyView()}
            ForEach(viewModel.typeOfEnd, id: \.self) { i in
                HStack{
                    ForEach(i, id: \.self) { item in
                        Button {
                            writeDataOfAction(typeOfShot: item)
                            presentSheet.toggle()
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black)
                                .overlay(
                                    Text(item)
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
                                )
                        }
                        .sheet(isPresented: $presentSheet) {
                            SelectShotParamsView(showAlert: $showAlert).environmentObject(game)
                        }
                        
                            
                    }
                }
            }
            Spacer()
            BackButton
        }
    
        
            .padding(.horizontal)
            .padding(.bottom)
            .navigationBarItems(leading: MainTitle)
            .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        CustomAlert(isShow: $showAlert, largeTitle: "Готово!", smallTitle: "Действие записано!", titleButton: "Ok", selfClosed: false) {
            nextView.toggle()
        }
        }
    }
    
    func writeDataOfAction(typeOfShot: String){
        if let shot = game.currentAction as? Shot{
            shot.typeOfEnding = typeOfShot
        }
        
    }
    
    var MainTitle: some View{
        Text("Способ завершения")
            .font(.system(size: 24))
            .foregroundColor(.black)
            .fontWeight(.medium)
    }
    
    var BackButton: some View{
        Button {
            dismiss()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.appOrange, lineWidth: 3)
                .overlay(
                    Image("Arrow.left")
                        .foregroundColor(.appOrange)
                        .font(.system(size: 24))
                )
                .frame(height: UIScreen.main.bounds.height * 0.1)
        }
    }
}

struct SelectShotView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        SelectShotView()
        }
    }
}
