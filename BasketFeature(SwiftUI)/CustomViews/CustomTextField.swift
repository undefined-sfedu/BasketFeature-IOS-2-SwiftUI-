//
//  TextFieldCell.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import SwiftUI

struct CustomTextField: View {
    @State var beginEditTextField = false
    @Binding var description: TextFieldDescription
    var isSecureField = false
    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(description.borderColor)
                .overlay {

                    if isSecureField{
                        CustomSecureField
                    }
                    else{
                        CustomTextField
                    }
                }

                .frame(height: UIScreen.main.bounds.height * 0.09)

            HStack {
                Text("*\(description.titleOfError)")
                    .italic()
                    .foregroundColor(description.visibleOfError ? Color.red : Color.white)
                Spacer()
            }
            .padding(.leading)

        }
        .padding(.horizontal)
    }


    var CustomTextField: some View{
//        TextField(description.placeholder, text:  $description.fieldValue, onEditingChanged: { item in
//            description.visibleOfError = false
//            if !beginEditTextField{
//                description.borderColor = .customOrange
//                description.titleColor = .customOrange
//            }
//            else{
//                description.borderColor = .customGray
//                description.titleColor = .black
//            }
//            beginEditTextField.toggle()
//        })
        TextField(description.placeholder, text: $description.fieldValue)
        .disableAutocorrection(true)
        .foregroundColor(description.titleColor)
        .padding(.leading)
    }

    var CustomSecureField: some View{
            SecureField(description.placeholder, text: $description.fieldValue)
            .foregroundColor(description.titleColor)
            .padding(.leading)
//            TextField(description.placeholder, text:  $description.fieldValue, onEditingChanged: { item in
//                description.visibleOfError = false
//                if !beginEditTextField{
//                    description.borderColor = .customOrange
//                    description.titleColor = .customOrange
//                }
//                else{
//                    description.borderColor = .customGray
//                    description.titleColor = .black
//                }
//                beginEditTextField.toggle()
//            })
//            .disableAutocorrection(true)
//            .foregroundColor(.white)


        
    }
}

//struct TextFieldCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField(description: .constant(TextFieldDescription(fieldValue: "", placeholder: "Введите пароль", titleOfError: "неверный формат", borderColor: .customGray, titleColor: .black, visibleOfError: false)), isSecureField: true)
//            .previewLayout(.sizeThatFits)
//    }
//}
