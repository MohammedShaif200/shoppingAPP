//
//  OnlineShopingApp.swift
//  OnlineShoping
//
//  Created by moh on 12/11/2024.
//

import SwiftUI

@main
struct OnlineShopingApp: App {
    @StateObject var mianVM = MainViewModel.shared
    var body: some Scene {
        WindowGroup {
            NavigationView{
                if mianVM.isUserLogin {
                    MainTabView()
                }else{
                    WelcomeView()

                }
            }
           
        }
    }
}
