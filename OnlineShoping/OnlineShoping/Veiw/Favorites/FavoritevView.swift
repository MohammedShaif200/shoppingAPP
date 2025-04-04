//
//  FavoritevView.swift
//  OnlineShoping
//
//  Created by moh on 06/01/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoritevView: View {
    @StateObject var favVM  = FavoriteViewModel.shared
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack{
                    ForEach(favVM.listArr , id: \.id ,content: {
                        fobj in
                            FavorateRow(fobj: fobj)
                      })
                    
                }
                .padding(20)
                .padding(.top,.topInsets + 46)
                .padding(.bottom,.bottomInsets + 60)
                
            }
            //.padding(.top,.topInsets + 46)
            
            VStack{
                HStack{
                    Spacer()
                    Text("Favorite")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                }
                .padding(.top,.topInsets)
                .background(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 2)
                
                Spacer()
                RoundButton(title: "Add All To Cart")
                    .padding(.horizontal,20)
                    .padding(.bottom,.bottomInsets + 60)
             
            }
            
        }
        .onAppear{
            favVM.serviceCallList()
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(false)
        .ignoresSafeArea()
    }
}

#Preview {
    FavoritevView()
}
