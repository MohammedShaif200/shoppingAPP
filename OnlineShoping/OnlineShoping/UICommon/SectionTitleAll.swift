//
//  SectionTitleAll.swift
//  OnlineShoping
//
//  Created by moh on 03/01/2025.
//

import SwiftUI

struct SectionTitleAll: View {
    @State var title : String = "Title"
    @State var titleAll:String = "Title All"
    var didTop : (()->())?
    var body: some View {
        HStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundColor(.primaryText)
            
            Spacer()
            Text(titleAll)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryAPP)
        }
        .frame(height: 40)
    }
}

#Preview {
    SectionTitleAll()
}
