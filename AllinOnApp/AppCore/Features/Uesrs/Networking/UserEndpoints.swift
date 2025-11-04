//
//  UserEndpoints.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI

enum UserEndpoints {
    case getUsers
    case getUserById(id:String)
    case signUp(parameters: [String: Any])
}
extension UserEndpoints:APIEndpoint{
//    var baseURL: URL {
//        return URL(string: "https://dummyapi.io/data/v1/")!
//        
//        
//    }
    
    var baseURL: URL {
        return URL(string: "https://procare.runasp.net/api/")!
    }
    
    var path: String {
        switch self{
        case .getUsers:
            return "/user"
        case .getUserById(let id):
            return "/user/:\(id)"
        case .signUp:
            return "Auth/register"
        }
    }
    
    var method: HTTPMethod {
        switch self{
        case .getUsers:
            return .get
        case .getUserById:
            return .get
        case .signUp:
            return .post
        }
    }
    
    var headers: [String : String]? {
        return  ["accept" : "*/*", "Content-Type" : "application/json"]
    }
    
    
    var parameters: Parameters? {
        switch self {
        case .getUsers:
            return .requestNoParameters
        case .getUserById:
            return .requestNoParameters
        case .signUp(parameters: let parameters):
            <#code#>
        }
    }
    
//    var currentLang: String {
//        get {
//            return LocalizationManager.shared.currentLanguage.NetworkLanguage
//        }
//    }
    
    
}
