//
//  GameCell.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 31.10.2023.
//

import SwiftUI

struct GameCell: View {
    
    var title: String
    var dateString: String
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .padding(.bottom)
                Text(dateString)
                    .foregroundColor(.appGray)
            }
            .padding(.leading)
            .padding(.vertical)
            Spacer()
        }
        
    }
}

struct GameCell_Previews: PreviewProvider {
    static var previews: some View {
        GameCell(title: "Химки-ЦСКА", dateString: "21.07.2023")
            .previewLayout(.sizeThatFits)
            
            
    }
}
