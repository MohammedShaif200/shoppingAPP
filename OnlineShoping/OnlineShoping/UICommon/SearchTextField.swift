//
//  SearchTextField.swift
//  OnlineShoping
//
//  Created by moh on 03/01/2025.
//

import SwiftUI

struct SearchTextField: View {
    @State   var placeholder :String = "Ploceholder"
    @Binding var txt:String
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 20,height: 20)
            
            TextField(placeholder,text: $txt)
                .font(.customfont(.regular, fontSize: 17))
                .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .frame(minWidth: 0,maxWidth: .infinity)
            
            
            
        }
        .frame(height: 30)
        .padding(15)
        .background(Color(hex: "F2F3F2"))
        .cornerRadius(16)
    }
}


struct SearchTextFieldPreviewHelper : View{
    @State  var txt : String = ""
    
    var body: some View{
        SearchTextField(placeholder: "Search store", txt: $txt)
            .padding(15)
        
    }
}

#Preview {
    SearchTextFieldPreviewHelper()
}
