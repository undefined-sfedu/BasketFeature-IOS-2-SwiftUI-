//
//  SelectLossView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 19.10.2022.
//

import SwiftUI

struct SelectLossView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = SelectLossViewModel()
    @State var nextView = false
    @State var showAlert = false
    var body: some View {
        ZStack {
            VStack{
                NavigationLink(destination: SelectTimeAndTeam(), isActive: $nextView) {EmptyView()}
                ForEach(viewModel.typesOfLoss, id: \.self) { item in
                    Button {
                        showAlert.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.black)
                            .overlay(
                                Text(item)
                                    .foregroundColor(.black)
                                    .font(.system(size: 24))
                            )
                    }

                    
                }
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
        Text("Потеря")
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

struct SelectLossView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        SelectLossView()
        }
    }
}
