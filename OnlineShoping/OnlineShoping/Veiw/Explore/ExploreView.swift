//
//  ExploreView.swift
//  OnlineShoping
//
//  Created by moh on 02/01/2025.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var expVm = ExploreViewModel.shared
    @State var txtserch :String = ""
    
    var colums = [
        GridItem(.flexible(),spacing: 15),
        GridItem(.flexible(),spacing: 15)
    ]
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Text("Find Product")
                        .font(.customfont(.bold, fontSize: 46))
                        .frame(height: 46)
                    Spacer()
                }
                 .padding(.top,.topInsets )
                
                SearchTextField(placeholder: "Search Store", txt: $txtserch)
                    .padding(.horizontal,20)
                    .padding(.bottom,4)
                
                ScrollView{
                    LazyVGrid(columns: colums,spacing: 20) {
                        ForEach(expVm.listArr,id: \.id) {
                            cobj in
                            NavigationLink(
                                destination: ExploreItemsView(itemVm:  ExploreItemViewModel(cObj: cobj)) ){
                                
                                ExploreCategoryCall(cObj: cobj)
                                    .aspectRatio(0.95,contentMode: .fill)
                            }
                        }
                        
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    .padding(.bottom,.bottomInsets +  60)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        
        ExploreView()
    }
}
