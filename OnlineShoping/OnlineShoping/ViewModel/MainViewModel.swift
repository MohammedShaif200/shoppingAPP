//
//  MainViewModel.swift
//  OnlineShoping
//
//  Created by moh on 22/11/2024.
//

import SwiftUI

class MainViewModel: ObservableObject  {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtUsername: String = ""
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
     @Published var showError = false
     @Published var errorMessage = ""
    @Published var isUserLogin : Bool = false
    @Published var userObj : UserModel = UserModel(dict: [:])
    
    init(){
        
        if (Utils.UDValueBool(key: Globs.userLogin)){
            self.setUserData(uDict: Utils.UDValue(key: Globs.userPayload) as? NSDictionary  ?? [:])
        }else{
            
        }
        #if DEBUG
        txtUsername = "user4"
        txtEmail = "test@gmail.com"
        txtPassword = "123456"
        #endif
    }
    
    //MARK: ServiceCall
    func serviceCellLogin(){
        if !txtEmail.isValidEmail{
            self.errorMessage = "please enter valid email"
            self.showError=true
            return
        }
          
        if txtPassword.isEmpty{
            self.errorMessage = "please enter vali password"
            self.showError=true
            return
        }
        
        ServiceCall.post(parameter: ["email":txtEmail,"password":txtPassword,"dervice_token":""], path: Globs.SV_LOGIN) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.setUserData(uDict: response.value(forKey: KKey.payload) as? NSDictionary ?? [:])
                   
                } else
                {
                    
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Faild"
                    self.showError=true
                }
            }
        } failure: { error in
            
            self.errorMessage = error?.localizedDescription ?? "Faild"
            self.showError=true
        }

    }
    
    func serviceCellSignUP(){
        
        
      if txtUsername.isEmpty{
          self.errorMessage = "please enter vali UserName"
          self.showError=true
          return
      }
      
        
        if !txtEmail.isValidEmail{
            self.errorMessage = "please enter valid email"
            self.showError=true
            return
        }
          
        if txtPassword.isEmpty{
            self.errorMessage = "please enter vali password"
            self.showError=true
            return
        }
        
        ServiceCall.post(parameter:["username":txtUsername, "email":txtEmail,"password":txtPassword,"dervice_token":""], path: Globs.SV_SIGNUP) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                   
                   
                    self.setUserData(uDict: response.value(forKey: KKey.payload) as? NSDictionary ?? [:])
                    
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError=true
                } else
                {
                    
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Faild"
                    self.showError=true
                }
            }
        } failure: { error in
            
            self.errorMessage = error?.localizedDescription ?? "Faild"
            self.showError=true
        }

    }
    func setUserData(uDict : NSDictionary){
        
         var  payload = uDict
         Utils.UDSET(data: payload, key: Globs.userPayload)
         Utils.UDSET(data: true, key: Globs.userLogin)
        self.userObj = UserModel(dict: uDict)
        
        self.isUserLogin = true
        self.txtUsername = ""
        self.txtEmail = ""
        self.txtPassword = ""
        self.isShowPassword = false
        
             }
}
 

