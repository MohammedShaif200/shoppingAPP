//
//  LoginView.swift
//  OnlineShoping
//
//  Created by moh on 21/11/2024.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var mode:Binding<PresentationMode>
     
    @StateObject var loginVM = MainViewModel.shared;
    var body: some View {
        ZStack{
        Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                
                    Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding( .bottom,.screenWidth*0.1)
                
                Text("Logining")
                    .font(.customfont(.semibold, fontSize: 26 ))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom,4)
                
                Text("Enter your email and password")
                    .font(.customfont(.semibold, fontSize: 16 ))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom,.screenWidth * 0.1)
                
                LineTextField(title:"Emil",placeholder: "Enter your email address",keyboardType: .emailAddress,txt: $loginVM.txtEmail)
                    .padding(.bottom,.screenWidth * 0.07)
                
                LineSecureField( isShowPassword: $loginVM.isShowPassword,title: "Password",placeholder: "Enter your Password",txt:$loginVM.txtPassword)
                    .padding(.bottom,.screenWidth * 0.02)
                Button{
                    
                }label: {
                    Text("Forget Password?")
                        .font(.customfont(.medium, fontSize:14 ))
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .trailing)
                .padding(.bottom,.screenWidth*0.03)
                RoundButton(title: "login"){
                    loginVM.serviceCellLogin()
                }
            
                .padding(.bottom,.screenWidth*0.03)
                NavigationLink{
                    SignUpView()
                } label: {
                
                    HStack{
                        Text("Dont have an account?")
                            .font(.customfont(.medium, fontSize:14 ))
                            .foregroundColor(.primaryText)
                    
                        Text("signup")
                            .font(.customfont(.medium, fontSize:14 ))
                            .foregroundColor(.primaryAPP)
                    
                    }
                  
                }
                Spacer()
                
            }
            .padding(.top,.topInsets + 64)
            .padding(.horizontal,20)
            .padding(.bottom,.bottomInsets)
            
            VStack{
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                         Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top,.topInsets)
            .padding(.horizontal,20)
            
        }
        .alert(isPresented: $loginVM.showError){
            Alert(title: Text(Globs.AppName),message: Text(loginVM.errorMessage),dismissButton: .default(Text("ok")))
        }
        .background(Color.white)
        
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        
    }
}

#Preview {
    NavigationView{ LoginView()
}
        }
