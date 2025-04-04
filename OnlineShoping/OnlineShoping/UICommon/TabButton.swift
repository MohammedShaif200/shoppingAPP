//
//  TabButtom.swift
//  OnlineShoping
//
//  Created by moh on 02/01/2025.
//

import SwiftUI

struct TabButton: View {
    @State var title : String = "shop"
    @State var icone :String = "store_tab"
    var isSelect : Bool = false
    var didSelect: (()->())
    var body: some View {
        Button{
            debugPrint("Tab Button Tap ")
            didSelect()
        } label: {
            VStack{
                Image(icone)
                    .resizable()
                    .scaledToFit()
                    .frame( width: 25,height: 25)
                
                Text(title)
                    .font(.customfont(.semibold, fontSize:  14))
            }
        }
        .foregroundColor(isSelect  ? .primaryAPP : .primaryText )
        
        .frame(minWidth: 0, maxWidth: .infinity)
        
    }
}

#Preview {
    TabButton {
        
    }
}
