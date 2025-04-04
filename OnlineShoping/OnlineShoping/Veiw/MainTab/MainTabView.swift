//
//  MainTabView.swift
//  OnlineShoping
//
//  Created by moh on 18/12/2024.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var homeVM = HomeViewModel.shared
    var body: some View {
        ZStack{
            
            
            if(homeVM.selectTab == 0) {
                HomeView()
            } else if (homeVM.selectTab == 1) {
                ExploreView()
            } else if (homeVM.selectTab == 2) {
                MyCartView()
            } else if (homeVM.selectTab == 3) {
                FavoritevView()
            } else if (homeVM.selectTab == 4) {
                ExploreView()
            }
            VStack{
                Spacer()
                
                HStack{
                    TabButton(title: "Shop",icone: "store_tab", isSelect: homeVM.selectTab == 0 ){
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 0
                            }
                        }
                    }
                    
                    TabButton(title: "Explore",icone: "explore_tab", isSelect: homeVM.selectTab == 1 ){
                        
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 1
                            }
                        }
                    }
                    
                    TabButton(title: "Cart",icone: "cart_tab", isSelect:
                                homeVM.selectTab == 2 ){
                        
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 2
                            }
                        }
                    }
                    
                    TabButton(title: "Favourite",icone: "fav_tab", isSelect: homeVM.selectTab == 3 ){
                        
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 3
                            }
                        }
                    }
                    
                    TabButton(title: "Account",icone: "account_tab", isSelect: homeVM.selectTab == 4 ){
                        
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 4
                            }
                        }
                    }
                    
                    
                }
                
                
                
                
            
            .padding(.top, 10)
            .padding(.bottom,.bottomInsets)
            .padding(.horizontal,10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
        }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
