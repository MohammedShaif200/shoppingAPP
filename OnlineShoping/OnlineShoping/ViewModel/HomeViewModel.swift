//
//  HomeViewModel.swift
//  OnlineShoping
//
//  Created by moh on 02/01/2025.
//

import SwiftUI

class HomeViewModel:  ObservableObject
{
    static var shared : HomeViewModel = HomeViewModel()
    @Published var selectTab :Int = 0
    @Published var txtSearch : String = ""
    
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isUserLogin : Bool = false
    
    @Published var offerArr: [ProductModel] = []
    @Published var bestArr: [ProductModel] = []
    @Published var listArr: [ProductModel] = []
    @Published var typeArr: [TypeModel] = []

    init(){
        serviceCallList()
    }

    //MARK: ServiceCall
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_HOME,isToken:  true) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    if let payloadobj = response.value(forKey: KKey.payload) as? NSDictionary{
                        self.offerArr = ( payloadobj.value(forKey: "offer_list") as? NSArray ?? []).map({
                            obj in return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        self.bestArr = (payloadobj.value(forKey: "best_sell_list") as? NSArray ?? []).map({obj in return ProductModel(dict: obj as? NSDictionary ?? [:])})
                        
                        self.listArr = (payloadobj.value(forKey: "list") as? NSArray ?? []).map({
                            obj in return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.typeArr = (payloadobj.value(forKey: "type_list") as? NSArray ?? []).map({
                            obj in return TypeModel(dict: obj as? NSDictionary ?? [:])
                        })
                    }
                    
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
