//
//  SwiftUIView.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 02.10.2022.
//

import SwiftUI

struct TeamCell: View {
    
    var name: String
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.black)
                
            Text(name)
                .padding(.leading)
        }
        
    }
}

struct TeamCell_Previews: PreviewProvider {
    static var previews: some View {
        TeamCell(name: "Команда")
            .previewLayout(.sizeThatFits)
            
            
    }
}
