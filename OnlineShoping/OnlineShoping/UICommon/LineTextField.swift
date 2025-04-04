//
//  LineTextField.swift
//  OnlineShoping
//
//  Created by moh on 22/11/2024.
//

import SwiftUI

struct LineTextField: View {
    
    @State   var title:String = "Title"
    @State   var placeholder :String = "Ploceholder"
    @State   var keyboardType:UIKeyboardType = .default
    @Binding var txt:String
    
    var body: some View {
        
                 VStack {
                     
                Text(title)
                    .font(.customfont(.semibold, fontSize: 16 ))
                    .foregroundColor(.textTitle)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
              
    
                     TextField(placeholder,text: $txt)
                         .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                         .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                         .disableAutocorrection(true)
                         .frame(height: 40)
                     
             Divider()

         }
    }
}
struct LineTextFieldPreviewHelper : View{
    @State  var txt : String = ""
    
    var body: some View{
         LineTextField(txt: $txt)
            .padding(20)
        
    }
}

#Preview {
    
    LineTextFieldPreviewHelper()
}
