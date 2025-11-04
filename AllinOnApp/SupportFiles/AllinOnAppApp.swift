//
//  AllinOnAppApp.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 24/12/2023.
//

import SwiftUI

@main
struct AllinOnAppApp: App {
    var body: some Scene {
        WindowGroup {
           // TapBarView()
            RouterView()
        }
    }
}


extension String {

    /// Localizes a string using given language from Language enum.
    /// - parameter language: The language that will be used to localized string.
    /// - Returns: localized string.
    func localized(_ language: Language) -> String {
        let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        let bundle: Bundle
        if let path = path {
            bundle = Bundle(path: path) ?? .main
        } else {
            bundle = .main
        }
        return localized(bundle: bundle)
    }
    
    func localized() -> String {
        let  language = LocalizationService.shared.language // get language from LocalizationService
        let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        let bundle: Bundle
        if let path = path {
            bundle = Bundle(path: path) ?? .main
        } else {
            bundle = .main
        }
        return localized(bundle: bundle)
    }
    
    

    /// Localizes a string using given language from Language enum.
    ///  - Parameters:
    ///  - language: The language that will be used to localized string.
    ///  - args:  dynamic arguments provided for the localized string.
    /// - Returns: localized string.
    func localized(_ language: Language, args arguments: CVarArg...) -> String {
        let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        let bundle: Bundle
        if let path = path {
            bundle = Bundle(path: path) ?? .main
        } else {
            bundle = .main
        }
        return String(format: localized(bundle: bundle), arguments: arguments)
    }

    /// Localizes a string using self as key.
    /// - Parameters:
    ///   - bundle: the bundle where the Localizable.strings file lies.
    /// - Returns: localized string.
    private func localized(bundle: Bundle) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}

class LocalizationService {

    static let shared = LocalizationService()
   // static let changedLanguage = Notification.Name("changedLanguage")

    private init() {}
    
    var language: Language {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                return .english
            }
            return Language(rawValue: languageString) ?? .english
        } set {
            if newValue != language {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
              //  NotificationCenter.default.post(name: LocalizationService.changedLanguage, object: nil)
            }
        }
    }
}


struct SettingsView: View {

    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    var body: some View {
        VStack(alignment: .leading) {

                Text("settings_language".localized(language))
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
          
                    Button {
                        LocalizationService.shared.language = .english
                    } label: {
                        Text("English (US)")
                  
                    }
                    Button {
                        LocalizationService.shared.language = .arabic
                    } label: {
                        Text("Arabic")
                     
                    }
          
     
    
        }
    }
}
