//
//  UserDefaultsValues.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//

import Foundation

extension UserDefaultsHelper {
    
    enum Keys: UserDefaultsStringValue {
        case auth(_ key: AuthKeys)
        case app(_ key: AppKeys)
        
        var keyString: String {
            switch self {
            case .auth:
                return "auth"
            case .app:
                return "app"
            }
        }
        
        var subKeyString: String {
            switch self {
            case .auth(let val):
                return val.rawValue
            case .app(let val):
                return val.rawValue
            }
        }
    }
    
    
    enum AuthKeys: String {
        case userCartData
        case userSessionData
        case userProfileData
        case userType
        case preferenceData
        case deviceToken
        case loginProvider
        case twitterToken
        case twitterTokenSecret
    }
    
    enum AppKeys: String {
        case firstLaunch
        case currentLanguage
        case appDomain
        case apiClientId
        case apiClientSecret
        case curaUserApiKey
        case fireBaseToken
        case AppConfigModel
    }
}

protocol UserDefaultsStringValue {
    var keyString: String { get }
    var subKeyString: String { get }
    var userDefaultsKey: String { get }
}

extension UserDefaultsStringValue {
    var userDefaultsKey: String {
        return keyString + subKeyString
    }
}
