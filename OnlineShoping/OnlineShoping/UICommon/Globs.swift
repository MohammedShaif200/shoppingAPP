//
//  Globs.swift
//  OnlineShoping
//
//  Created by moh on 09/12/2024.
//

import SwiftUI

struct Globs  {
    static let AppName = "online grocery"
    static let BaseUrl = "http://localhost:3001/api/app/"
    static let SV_LOGIN = BaseUrl + "login"
    static let SV_SIGNUP = BaseUrl + "sign_up"
    static let SV_HOME = BaseUrl + "home"
    static let SV_PRODUCT_DETAIL = BaseUrl + "product_detail"
    static let SV_ADD_REMOVE_FAVORITE = BaseUrl + "add_remove_favorite"
    static let SV_FAVORITE_LIST = BaseUrl + "favorite_list"
    static let SV_ADD_CART = BaseUrl + "add_to_cart"
    static let SV_UPDATE_CART = BaseUrl + "update_cart"
    static let SV_CART_LIST = BaseUrl + "cart_list"
    static let SV_REMOVE_CAERT = BaseUrl + "remove_cart"
    static let SV_EXPLORE_LIST = BaseUrl + "explore_category_list"
    static let SV_EXPLORE_item_LIST = BaseUrl + "explore_category_items_list"
     static let userPayload = "user_payload"
    
    static let userLogin = "user_login"
}
struct KKey {
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
}
class Utils {
    class func UDSET(data: Any, key: String) {
        UserDefaults.standard.setValue(data, forKey: key) as Any
        UserDefaults.standard.synchronize()
    }
    class func UDValue(key :String) -> Any{
        return UserDefaults.standard.value(forKey: key) as Any
    }
    class func UDValueBool(key:String) -> Bool {
        return UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
    
    class func UDValueTrueBool (key :String) -> Bool {
        return UserDefaults.standard.value(forKey: key) as? Bool ?? true
    }
    class func UDRemove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}

 
