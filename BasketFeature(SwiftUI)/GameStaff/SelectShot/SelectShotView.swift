//
//  SelectShot.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 20.10.2022.
//

import SwiftUI

struct SelectShotView: View {
    @StateObject var viewModel  = SelectShotViewModel()
    @Environment (\.dismiss) var dismiss
    @State var presentSheet = false
    @State var nextView = false
    @State var showAlert = false
    var body: some View {
        ZStack{
        VStack(alignment: .leading){
            NavigationLink(destination: SelectTimeAndTeam(), isActive: $nextView) {EmptyView()}
            ForEach(viewModel.typeOfEnd, id: \.self) { i in
                HStack{
                    ForEach(i, id: \.self) { item in
                        Button {
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
                            SelectShotParamsView(showAlert: $showAlert)
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
                .strokeBorder(Color.customOrange, lineWidth: 3)
                .overlay(
                    Image("Arrow.left")
                        .foregroundColor(.customOrange)
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
