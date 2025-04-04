//
//  FavorateRow.swift
//  OnlineShoping
//
//  Created by moh on 06/01/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavorateRow: View {
    @State var fobj : ProductModel = ProductModel(dict: [:])
    var body: some View {
        VStack{
            HStack(spacing: 15){
                WebImage(url: URL(string: fobj.image))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                
                VStack(spacing:4){
                    Text(fobj.name)
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame( minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    
                    Text("\(fobj.unitValue)\(fobj.unitName),price")
                        .font(.customfont(.medium, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame( minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    
                    
                }
                
                Text("\(fobj.offerPrice ?? fobj.price,specifier: "%.2f" )")
                    .font(.customfont(.bold, fontSize: 18))
                    .foregroundColor(.primaryText)
                
                Image("next")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                
            }
                
                Divider()
            
        }
    
    }
}

#Preview {
    FavorateRow()
}
