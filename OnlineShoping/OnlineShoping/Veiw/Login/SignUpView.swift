//
//  SignUpView.swift
//  OnlineShoping
//
//  Created by moh on 15/12/2024.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
    
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenHeight)
            ScrollView{
                VStack{
                    
                        Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding( .bottom,.screenWidth*0.1)
                    
                    Text("Sign Up")
                        .font(.customfont(.semibold, fontSize: 26 ))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        .padding(.bottom,4)
                    
                    Text("Enter your credentionals to continue")
                        .font(.customfont(.semibold, fontSize: 16 ))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                        .padding(.bottom,.screenWidth * 0.1)
                    
                    LineTextField(title:"UserName",placeholder: "Enter your UserName  ",txt: $mainVM.txtUsername)
                        .padding(.bottom,.screenWidth * 0.07)
                    
                    
                    LineTextField(title:"Emil",placeholder: "Enter your email address",keyboardType: .emailAddress,txt: $mainVM.txtEmail)
                        .padding(.bottom,.screenWidth * 0.07)
                    
                    LineSecureField( isShowPassword: $mainVM.isShowPassword,title: "Password",placeholder: "Enter your Password",txt:$mainVM.txtPassword)
                        .padding(.bottom,.screenWidth * 0.02)
                    VStack{
                        Text("By continuing you agrea to our")
                            .font(.customfont(.medium, fontSize:14))
                            .foregroundColor(.secandaryText)
                            .frame(minWidth:  0 ,maxWidth:.infinity, alignment :.leading)
                        
                        HStack{
                            
                            Text("Terms of Service")
                                .font(.customfont(.medium, fontSize:14))
                                .foregroundColor(.primaryAPP)
                            
                            Text("  and  ")
                                .font(.customfont(.medium, fontSize:14))
                                .foregroundColor(.secandaryText)
                                .frame(minWidth:  0 ,maxWidth:.infinity, alignment :.leading)
                            
                                Text("Privacy Policy.")
                                    .font(.customfont(.medium, fontSize:14))
                                    .foregroundColor(.secandaryText)
                                    .frame(minWidth:  0 ,maxWidth:.infinity, alignment :.leading)
                            
                        }.padding(.bottom,.screenWidth * 0.03)
                    }
                    RoundButton(title: "Sign Up"){
                        mainVM.serviceCellSignUP()
                    }
                
                    .padding(.bottom,.screenWidth*0.03)
                    NavigationLink{
                        LoginView()
                    } label: {
                    
                        HStack{
                            Text("Alredy have an account?")
                                .font(.customfont(.medium, fontSize:14 ))
                                .foregroundColor(.primaryText)
                        
                            Text("sign In")
                                .font(.customfont(.medium, fontSize:14 ))
                                .foregroundColor(.primaryAPP)
                        
                        }
                      
                    }
                    Spacer()
                    
                }
                .padding(.top,.topInsets + 64)
                .padding(.horizontal,20)
                .padding(.bottom,.bottomInsets)
                
                
            }
            
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
                    Spacer()
                }
                Spacer()
            }
            .padding(.top,.topInsets)
            .padding(.horizontal,20)
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SignUpView()
}
