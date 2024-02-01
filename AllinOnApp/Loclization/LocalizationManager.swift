//
//  LocalizationManager.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//

import Foundation
import SwiftUI
import Combine

class LocalizationManager: ObservableObject {
    
    @Published private(set) var currentLanguage: Language

    static let shared = LocalizationManager()

    private init() {
        
        if let savedLocaleIdentifierString = UserDefaultsHelper.standard.read(key: .app(.currentLanguage), type: String.self) {
            currentLanguage = Language(rawValue: savedLocaleIdentifierString) ?? .arabic
        } else {
            let deviceLocale = NSLocale.current.languageCode ?? "ar"
            currentLanguage = Language(rawValue: deviceLocale) ?? .arabic
        }
        
    }
    
    private func setCurrentLanguage(language: Language) {
        UserDefaultsHelper.standard.save(language.rawValue, key: .app(.currentLanguage))
    }
    
    
    /// It toggles between Arabic and English
    ///
    /// - Attention: It should be called from the AppManager as the app state changes
    public func toggleLanguage() {
        if currentLanguage == .english {
            setCurrentLanguage(language: .arabic)
            currentLanguage = .arabic
        } else {
            setCurrentLanguage(language: .english)
            currentLanguage = .english
        }
        
//        AppAppearance.overrideNavAppearance()
//        Log.info("change language")
//        Log.error("change language")
//        Log.warning("change language")
    }
    
}
