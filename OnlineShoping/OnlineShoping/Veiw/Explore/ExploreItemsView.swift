//
//  ExploreItemsView.swift
//  OnlineShoping
//
//  Created by moh on 30/01/2025.
//

import SwiftUI

struct ExploreItemsView: View {
    @Environment(\.presentationMode) var mode :Binding<PresentationMode>
    @StateObject var itemVm = ExploreItemViewModel(cObj: ExploreCategoryModel(dict:[:]))
    
    var columns = [
        GridItem(.flexible( ),spacing: 15),
        GridItem(.flexible(),spacing:  15)
    ]
    var body: some View {
        ZStack{
            
            VStack{
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25)
                    }

                    Text(itemVm.cObj.name)
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .center)
                   
                    
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("share")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25)
                    }
                }
                ScrollView{
                    LazyVGrid(columns: columns,spacing:  20){
                        ForEach (itemVm.listArr ,id: \.id){
                            pobj in
                            
                            ProductCell(pObj: pobj,width: .infinity){
                                CartViewModel.serviceCallAddToCart(prodId: pobj.prodId, qty: 1) { isDone, message in
                                    self.itemVm.errorMessage = message

                                    self.itemVm.showError = true
                                }
                            
                            }
                        }
                    }
                     
                    .padding(.vertical,10)
                    .padding(.bottom,.bottomInsets + 60)
                }
            }
            .padding(.top,.topInsets)
            .padding(.horizontal,20)
          
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .alert(isPresented: $itemVm.showError,  content: {
            Alert(title: Text(Globs.AppName),message: Text(itemVm.errorMessage),dismissButton: .default(Text("OK")))
        })
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        ExploreItemsView(itemVm: ExploreItemViewModel(cObj: ExploreCategoryModel(dict: ["cat_id": 1,
                                                                                        "cat_name": "Frash Fruits & Vegetable",
                                                                                        "image": "http://localhost:3001/img/category/20230726155407547qM5gSxkrCh.png",
                                                                                        "color": "53B175"])))
    }
}
