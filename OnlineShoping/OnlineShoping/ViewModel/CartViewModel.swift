//
//  CartViewModel.swift
//  OnlineShoping
//
//  Created by moh on 30/01/2025.
//

import SwiftUI

class CartViewModel:  ObservableObject
{
    static var shared : CartViewModel = CartViewModel()
 
    @Published var listArr: [CartItemModel] = []
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var totol:Double = 0.0
    

    init(){
        serviceCallList()
    }

    
    //MARK: ServiceCall
    func serviceCallList(){
         ServiceCall.post(parameter: [:], path: Globs.SV_CART_LIST,isToken:  true) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.totol = response.value(forKey: KKey.status) as? Double ?? 0.0
                    self.listArr =  (response.value(forKey: KKey.payload)  as? NSArray ?? []).map({obj in
                        return CartItemModel(dict: obj as? NSDictionary ?? [:])})
                    
                
                    
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
    
    //MARK: ServiceCall
    func serviceCallRemove(cObj:CartItemModel){
        ServiceCall.post(parameter: ["cart_id":cObj.cartId ,"prod_id":cObj.prodId], path: Globs.SV_REMOVE_CAERT,isToken:  true) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Faild"
                    self.showError=true

                    self.serviceCallList()
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
    func serviceCallUpdate(cObj:CartItemModel,newQty:Int){
        ServiceCall.post(parameter: ["cart_id":cObj.cartId ,"prod_id":cObj.prodId
                                     ,"new_qty":newQty], path: Globs.SV_UPDATE_CART,isToken:  true) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Faild"
                    self.showError=true

                    self.serviceCallList()
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
    class func serviceCallAddToCart(prodId :Int,qty:Int,
                                    didDone:((_ isDone:Bool,_ message:String  )->())?)
    {
        ServiceCall.post(parameter: ["prod_id": prodId, "qty":qty],path: Globs.SV_ADD_CART,isToken:  true) { responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    didDone?(true,response.value(forKey: KKey.message) as? String ?? "Done")
                } else
                {
                    didDone?(true,response.value(forKey: KKey.message) as? String ?? "Fial")
                
                }
            }
        } failure: { error in
            didDone?(true,error?.localizedDescription ?? "Fial")
        }

    }
    
    
    
}
