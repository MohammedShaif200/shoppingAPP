//
//  ProductCell.swift
//  OnlineShoping
//
//  Created by moh on 03/01/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductCell: View {
    @State var pObj : ProductModel = ProductModel(dict: [:])
    @State var width:Double = 180
    var didAddTop : (()->())?
    var body: some View {
        NavigationLink{
            ProductDetailView(detailVM: ProductDetailViewModel(prodObj: pObj))
        }
        label :{
            
            VStack{
                WebImage(url: URL(string: pObj.image))
                    .resizable()
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .scaledToFit()
                    .frame(width: 100, height: 80)
                
                Spacer()
                
                Text(pObj.name)
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame( minWidth: 0,maxWidth: .infinity,alignment: .leading)
                
                Text("\(pObj.unitValue)\(pObj.unitName),price")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame( minWidth: 0,maxWidth: .infinity,alignment: .leading)
                
                Spacer()
                
                HStack{
                    
                    
                    Text("\(pObj.offerPrice ?? pObj.price,specifier: "%.2f" )")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame( minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    Spacer()
                    Button{
                        didAddTop?()
                    }label: {
                        
                        Image("add")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15,height: 15)
                        
                    }
                    .frame(width: 40,height: 40)
                    .background(Color.primaryAPP)
                    .cornerRadius(15)
                }
                
            }
            .padding(15)
            .frame(width:  width ,height: 230)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.placehohder.opacity(0.5), lineWidth: 1)
            )
        }
    }
}

#Preview {
    ProductCell(pObj: ProductModel(dict: ["prod_id": 6,
                                          "cat_id": 1,
                                          "brand_id": 1,
                                          "type_id": 1,
                                          "name": "Red Apple",
                                          "detail": "Apples contain key nutrients, including fiber and antioxidants. They may offer health benefits, including lowering blood sugar levels and benefitting heart health.",
                                          "unit_name": "kg",
                                          "unit_value": "1",
                                          "nutrition_weight": "182g",
                                          "price": 1.99,
                                          "image": "http://localhost:3001/img/product/202307310951365136W6nJvPCdzQ.png",
                                          "cat_name": "Frash Fruits & Vegetable",
                                          "type_name": "Pulses",
                                          "is_fav": 0,
                                          "avg_rating": 0]))
}
