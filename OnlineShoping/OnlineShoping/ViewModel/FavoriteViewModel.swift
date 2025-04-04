//
//  FavoriteViewModel.swift
//  OnlineShoping
//
//  Created by moh on 06/01/2025.
//

import SwiftUI


    class FavoriteViewModel:  ObservableObject
    {
        static var shared : FavoriteViewModel = FavoriteViewModel()
        
        @Published var txtSearch:String = ""
        @Published var showError = false
        @Published var errorMessage = ""
        
        
        @Published var listArr: [ProductModel] = []
        
        
        init(){
            serviceCallList()
        }

        //MARK: ServiceCall
        func serviceCallList(){
            ServiceCall.post(parameter: [:], path: Globs.SV_FAVORITE_LIST,isToken:  true) { responseObj in
                if let response = responseObj as? NSDictionary{
                    
                    if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                        self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({
                                obj in return ProductModel(dict: obj as? NSDictionary ?? [:])
                            })
                            
                            
                        
                        
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
        
    }
