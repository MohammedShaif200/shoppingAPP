//
//  LineSecureField.swift
//  OnlineShoping
//
//  Created by moh on 22/11/2024.
//

import SwiftUI

struct LineSecureField: View {
    
    @Binding var isShowPassword: Bool
    @State   var title:String = "Title"
    @State   var placeholder :String = "Ploceholder"
    @Binding var txt:String
    
    var body: some View {
                 VStack{
             Text(title)
                 .font(.customfont(.semibold, fontSize: 16 ))
                 .foregroundColor(.textTitle)
                   .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                     
                     if isShowPassword {
                         TextField(placeholder,text: $txt)
                             .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                             .disableAutocorrection(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                             .modifier(ShowButton(isShow: $isShowPassword))
                             .frame(height: 40)
                     } else {
                             SecureField(placeholder,text: $txt)
                             
                             .modifier(ShowButton(isShow: $isShowPassword))
                             .frame(height: 40)
                         
                     }
             Divider()

         }
    }
}

struct LineSecureFieldPreviewHelper : View{
    @State private var txt :String = ""
    @State private var isShowPassword :Bool = false
    
    var body: some View{
        LineSecureField(isShowPassword: $isShowPassword,txt: $txt)
            .padding(20)
    }
}

#Preview {
    
    LineSecureFieldPreviewHelper()
}


