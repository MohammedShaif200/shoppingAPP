//
//  MyCartView.swift
//  OnlineShoping
//
//  Created by moh on 30/01/2025.
//

import SwiftUI

struct MyCartView: View {
    @StateObject var cartVM = CartViewModel.shared
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack{
                    ForEach(cartVM.listArr , id: \.id ,content: {
                        cobj in
                            CartItemRow(cObj: cobj)
                      })
                    .padding(.bottom,8)
                    
                }
                .padding(20)
                .padding(.top,.topInsets + 46)
                .padding(.bottom,.bottomInsets + 60)
                
            }
            //.padding(.top,.topInsets + 46)
            
            VStack{
                HStack{
                    Spacer()
                    Text("My Cart")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                }
                .padding(.top,.topInsets)
                .background(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 2)
                
                Spacer()
                RoundButton(title: "Check out")
                    .padding(.horizontal,20)
                    .padding(.bottom,.bottomInsets + 60)
             
            }
           
        }
        .alert(isPresented: $cartVM.showError,  content: {
            Alert(title: Text(Globs.AppName),message: Text(cartVM.errorMessage),dismissButton: .default(Text("OK")))
        })
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        MyCartView()
    }
}
