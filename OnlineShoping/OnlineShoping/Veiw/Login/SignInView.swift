//
//  SignInView.swift
//  OnlineShoping
//
//  Created by moh on 18/11/2024.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
   
    @State var txtMobile :String = ""
    @State var isShowPicker :Bool = false
    @State var countryObj : Country?
    
    var body: some View {
        
        ZStack{
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenWidth)
         
            VStack{
                
                
                
                
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth,height: .screenWidth)
                
                Spacer()
            }
            
            ScrollView{
                VStack(alignment: .leading){
                    
                    
                    Text(" Get your groceries\nwith nectar")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.center)
                        .padding(.bottom,25)
                    
                    HStack{
                        Button{
                            isShowPicker = true
                        }label: {
                            //Image("")
                            if let countryObj =  countryObj {
                                
                                Text("\(countryObj.isoCode.getFlag())")
                                        .font(.customfont(.semibold, fontSize: 35))
                                         
                                
                                Text("+\(countryObj.phoneCode)")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                
                            }
                        }
                        TextField("enter Mobile",text: $txtMobile)
                            .frame(minWidth: 0,maxWidth: .infinity)
                        
                        
                    }
                    NavigationLink{
                        LoginView()
                    } label: {
                        Text("Contounce with email Sign in ")
                            .font(.customfont(.semibold, fontSize: 18)
                            )
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .cornerRadius(20)
                        
                    }
                    
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom,15)
                    
                    NavigationLink{
                        LoginView()
                    } label: {
                        Text("Contounce with email Sign Up ")
                            .font(.customfont(.semibold, fontSize: 18)
                            )
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .cornerRadius(20)
                        
                    }
                    
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                    .background(Color.primaryAPP)
                    .cornerRadius(20)
                    .padding(.bottom,15)
                    
                    Divider()
                        .padding(.bottom,25)
                    
                    
                    
                    
                    Text("  Or connect with social madia ")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,25)
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .center)
                    
                    
                    
                    Button{
                        
                    }label: {
                        
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                        Text("Contounce with Google ")
                            .font(.customfont(.semibold, fontSize: 18)
                            )
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .cornerRadius(20)
                        
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom,15)
                   
                    
                    
                    
                    Button{
                        
                    }label: {
                        
                        
                        Image("fb_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                        Text("Contounce with FaceBook ")
                            .font(.customfont(.semibold, fontSize: 18)
                            )
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .cornerRadius(20)
                        
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                    .background(Color(hex: "4A66AC"))
                    .cornerRadius(20)

                    
                    
                }
 
                .padding(.horizontal,20)
                .frame(width: .screenWidth,alignment: .leading)
                .padding(.top,.topInsets + .screenWidth*0.6)
                
                
            }
            
        }
        .onAppear{
            self.countryObj = Country(phoneCode: "091", isoCode: "IN")
        }
        .sheet(isPresented: $isShowPicker, content: {
              CountryPickerUI(contry: $countryObj)
        })
        .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        SignInView()}
   
}
