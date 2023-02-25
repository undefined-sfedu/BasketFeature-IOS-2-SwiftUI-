//
//  TextFieldCell.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import SwiftUI

struct CustomTextField: View {
    
    // MARK: - Properties
    @Binding var description: TextFieldModel
    var isSecureField = false
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(description.visibleOfError ? Color.appRed : Color.appGray)
                .overlay {
                    if isSecureField {
                        CustomSecureField
                    } else {
                        CustomTextField
                    }
                }
                
                .frame(height: UIScreen.main.bounds.height * 0.09)
            
            HStack {
                Text(description.titleOfError)
                    .italic()
                    .foregroundColor(description.visibleOfError ? Color.appOrange : Color.appWhite)
                Spacer()
            }
            .padding(.leading)
        }
        .padding(.horizontal)
    }

    // MARK: - Custom Views

    var CustomTextField: some View {
        TextField(description.placeholder, text: $description.fieldValue)
        .disableAutocorrection(true)
        .foregroundColor(description.visibleOfError ? Color.appRed : Color.appBlack)
        .padding(.leading)
    }

    var CustomSecureField: some View {
            SecureField(description.placeholder, text: $description.fieldValue)
            .foregroundColor(description.visibleOfError ? Color.appRed : Color.appBlack)
            .padding(.leading)
    }
}

struct TextFieldCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(description: .constant(TextFieldModel(placeholder: "placeholder", titleOfError: "titleOfError")))
            .previewLayout(.sizeThatFits)
    }
}
                    
