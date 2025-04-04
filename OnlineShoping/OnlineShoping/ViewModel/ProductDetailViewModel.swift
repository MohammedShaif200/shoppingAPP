//
//  ProductDetailViewModel.swift
//  OnlineShoping
//
//  Created by moh on 04/01/2025.
//

import SwiftUI


class ProductDetailViewModel:  ObservableObject
{
    @Published var pObj : ProductModel = ProductModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
 
   
    @Published var nutritionArr: [NutritionModel] = []
    @Published var imageArr: [ImageModel] = []

    @Published var isFav : Bool = false
    @Published var isShowDetail :Bool = false
    @Published var isShowNutrition :Bool = false
    @Published var qty :Int = 1
    
    func ShowNutrition(){
        isShowNutrition = !isShowNutrition
    }

    func showDetail(){
        isShowDetail = !isShowDetail
    }
    
    func addSubQty(isAdd :Bool = true){
        if(isAdd){
            qty += 1
            if(qty>99){
                qty = 99
            }
        }else{
            qty -= 1
            if(qty<1){
                qty = 1
            }

        }
    }
    
    init (prodObj :ProductModel){
        self.pObj = prodObj
        self.isFav = prodObj.isFav
        serviceCallDetail()
    }

    //MARK: ServiceCall
    func serviceCallDetail(){
        ServiceCall.post(parameter: ["prod_id":self.pObj.prodId], path: Globs.SV_PRODUCT_DETAIL,isToken:  true) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    if let payloadobj = response.value(forKey: KKey.payload) as? NSDictionary{
                        
                        self.pObj = ProductModel(dict: payloadobj)
                        self.nutritionArr = (payloadobj.value(forKey: "nutrition_list") as? NSArray ?? []).map({
                            obj in return NutritionModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.imageArr = (payloadobj.value(forKey: "image") as? NSArray ?? []).map({
                            obj in return ImageModel(dict: obj as? NSDictionary ?? [:])
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
    //MARK: ServiceCall
    func serviceCallAddRemove(){
        ServiceCall.post(parameter: ["prod_id":self.pObj.prodId], path: Globs.SV_ADD_REMOVE_FAVORITE,isToken:  true) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.isFav = !self.isFav
                    HomeViewModel.shared.serviceCallList()
                    
                    
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Done"
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
    
}

