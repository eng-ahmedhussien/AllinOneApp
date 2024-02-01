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
}
extension UserEndpoints:APIEndpoint{
    var baseURL: URL {
        return URL(string: "https://dummyapi.io/data/v1/")!
    }
    
    var path: String {
        switch self{
        case .getUsers:
            return "/user"
        case .getUserById(let id):
            return "/user/:\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self{
        case .getUsers:
            return .get
        case .getUserById:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return  ["app-id" : "62fb78b30fb89e62ca11c547"]
    }
    
    var parameters: Parameters? {
        switch self {
        case .getUsers:
            return .requestNoParameters
        case .getUserById:
            return .requestNoParameters
        }
    }
    
//    var currentLang: String {
//        get {
//            return LocalizationManager.shared.currentLanguage.NetworkLanguage
//        }
//    }
    
    
}
