//
//  CustomPlayerCell.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 04.10.2022.
//

import SwiftUI

struct CustomPlayerCell: View {
    var name: String = "Александр"
    var lastName: String = "Курбатов"
    var number: Int = 5
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .strokeBorder()
            .frame(height: UIScreen.main.bounds.height * 0.1)
            .overlay {
                HStack{
                    if name != ""{
                    Text(name + " " + lastName)
                    }
                    else{
                        Text("Добавьте имя")
                            .foregroundColor(.appGray)
                    }
                    Spacer()
                    Text("\(number)")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(.appOrange)
                        
                }.padding(.horizontal)
                
            }
        
    }
}

struct CustomPlayerCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomPlayerCell()
            .previewLayout(.sizeThatFits)
    }
}
