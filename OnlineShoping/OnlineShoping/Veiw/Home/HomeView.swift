//
//  HomeView.swift
//  OnlineShoping
//
//  Created by moh on 02/01/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    var body: some View {
        
        ZStack{
            ScrollView{
                VStack{
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    HStack{
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        Text("Dnaka, Bananssra")
                            .font(.customfont(.medium, fontSize: 18))
                            .foregroundColor(.darkGray)
                        
                    }
                    SearchTextField(placeholder: "Search Store", txt: $homeVM.txtSearch)
                        .padding(.horizontal,20)
                        .padding(.vertical,10)
                    
                }
                
                .padding(.top, .topInsets)
                
                Image("banner_top")
                    .resizable()
                    .scaledToFill()
                    .frame(height:115)
                    .padding(.horizontal,20)
                
                SectionTitleAll(title: "Exclusiveb offer",titleAll: "see all"){
                    
                }
                .padding(.horizontal,20)
                
                ScrollView(.horizontal,showsIndicators:  false){
                    LazyHStack(spacing: 15){
                        ForEach(homeVM.offerArr,id: \.id){
                            obj in
                            ProductCell(pObj: obj,didAddTop: {
                                CartViewModel.serviceCallAddToCart(prodId: obj.prodId, qty: 1) { isDone, message in
                                    self.homeVM.errorMessage = message

                                    self.homeVM.showError = true
                                }
                            })
                        }
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,4)
                }
                
                SectionTitleAll(title: "Best Seller",titleAll: "see all"){
                    
                }
                .padding(.horizontal,20)
                
                ScrollView(.horizontal,showsIndicators:  false){
                    LazyHStack(spacing: 15){
                        ForEach(homeVM.bestArr,id: \.id){
                            obj in
                            ProductCell(pObj: obj,didAddTop: {
                                
                                    CartViewModel.serviceCallAddToCart(prodId: obj.prodId, qty: 1) { isDone, message in
                                        self.homeVM.errorMessage = message

                                        self.homeVM.showError = true
                                    }
                            })
                        }                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,4)
                }
                
                
                
                SectionTitleAll(title: "Groeceries  ",titleAll: "see all"){
                    
                }
                .padding(.horizontal,20)
                
                
                ScrollView(.horizontal,showsIndicators:  false){
                    LazyHStack(spacing: 15){
                        ForEach(homeVM.typeArr ,id: \.id){
                            obj in
                            CategoryCell(tObj: obj ){
                                
                            }
                        }
                        
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,4)
                }
                .padding(8)
                
                ScrollView(.horizontal,showsIndicators:  false){
                    LazyHStack(spacing: 15){
                        ForEach(homeVM.listArr,id: \.id){
                            obj in
                            ProductCell(pObj: obj,didAddTop: {
                                
                                ProductDetailView()
                            })
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,4)
                }
                .padding(.bottom, .bottomInsets + 46)
                
                
                
            }
        }
        .alert(isPresented: $homeVM.showError,  content: {
            Alert(title: Text(Globs.AppName),message: Text(homeVM.errorMessage),dismissButton: .default(Text("OK")))
        })
        .ignoresSafeArea()
    }
    
    
}

#Preview {
    NavigationView{
        HomeView()
    }
}
