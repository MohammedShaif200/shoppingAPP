//
//  ExploreItemViewModel.swift
//  OnlineShoping
//
//  Created by moh on 30/01/2025.
//

import SwiftUI


class ExploreItemViewModel:  ObservableObject
{
    @Published var cObj : ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
 
   
    @Published var listArr: [ProductModel] = []
 
     
    
 
    
 
    init (cObj :ExploreCategoryModel){
        self.cObj = cObj
         serviceCallList()
    }

    //MARK: ServiceCall
    func serviceCallList(){
        ServiceCall.post(parameter: ["cat_id":self.cObj.id], path: Globs.SV_EXPLORE_item_LIST,isToken:  true) { responseObj in
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
