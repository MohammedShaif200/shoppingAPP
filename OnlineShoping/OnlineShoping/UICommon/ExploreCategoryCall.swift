//
//  ExploreCategoryCall.swift
//  OnlineShoping
//
//  Created by moh on 30/01/2025.
//
import SDWebImageSwiftUI

import SwiftUI

struct ExploreCategoryCall: View {
    @State var cObj : ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    @State var color: Color = Color.yellow
    var didTop: (()->())?
    var body: some View {
        VStack{
            WebImage(url: URL(string: cObj.image))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
                .frame(width: 70, height: 80)
            
            Spacer()
            Text(cObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame( minWidth: 0,maxWidth: .infinity,alignment: .center)
            Spacer()
        }
        .padding(15)
        
        .background(cObj.color.opacity(0.3))
        .cornerRadius(16)
        .overlay(
        RoundedRectangle(cornerRadius: 16)
            .stroke(cObj.color,lineWidth: 1)
        )
    }}

#Preview {
    ExploreCategoryCall(cObj: ExploreCategoryModel(dict:[
        "cate_id": 1,
                                              "cat_name": "Pulses",
                                              "image": "http://localhost:3001/img/type/202307261610181018aVOpgmY1W1.png",
                                              "color": "F8A44C"]))
    .padding(20)
}
