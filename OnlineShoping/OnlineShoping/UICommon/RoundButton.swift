//
//  RoundButton.swift
//  OnlineShoping
//
//  Created by moh on 18/11/2024.
//

import SwiftUI

struct RoundButton: View {
    @State var title :String = "totle"
    var didTop:(()->())?
    var body: some View {
        Button{
            didTop?()
        }label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18)
                )
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
        .background(Color.primaryAPP)
        .cornerRadius(20)
    }
}

#Preview {
    RoundButton()
        .padding(20)
}
