//
//  WelcomeView.swift
//  OnlineShoping
//
//  Created by moh on 12/11/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height:.screenHeight)
            
            VStack{
                Spacer()
                Image("app_logo")
                    .resizable()
                    .frame(width: 60,height: 60)
                    .padding(.bottom,8)
                
                Text("welocome\n to our store ")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                
                
                Text(" get your groceriesin as fast as one hour ")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom,30)
 
                NavigationLink{
                    SignInView()
                } label: {
                    RoundButton(title: "Get Started"){
                
                        }
                 }

                
                
                Spacer()
                    .frame(height: 80)
                
            }.padding(.horizontal,20)
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}

#Preview {
    NavigationView{
        WelcomeView()
    }
 }

