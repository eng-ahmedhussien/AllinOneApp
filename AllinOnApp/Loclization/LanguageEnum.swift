//
//  LanguageEnum.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//

import Foundation
import SwiftUI
enum Language: String {
    
    case arabic = "ar"
    case english = "en"
    
    var locale: Locale {
        switch self {
        case .arabic:
            return Locale(identifier: Language.arabic.rawValue)
        case .english:
            return Locale(identifier: Language.english.rawValue)
        }
    }
   
    
    var layoutDirection: LayoutDirection {
        switch self {
        case .arabic:
            return .rightToLeft
        case .english:
            return .leftToRight
        }
    }
    
    var NetworkLanguage: String {
        switch self {
        case .arabic:
            return "ar"
        case .english:
            return  "en"
        }
    }
    
    var ClinicsLanguage: String {
        switch self {
        case .arabic:
            return "arabic"
        case .english:
            return  "english"
        }
    }
    var curaNetworkLanguage: String {
        switch self {
        case .arabic:
            return "ar-EG"
        case .english:
            return  "en-US"
        }
    }
}
