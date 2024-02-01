//
//  UserDefaultsHelper.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//

import Foundation


final class UserDefaultsHelper {
    
    static let standard = UserDefaultsHelper()
    private init() { }
    
    //MARK: Public API
    public func save<T>(_ item: T, key: Keys) where T : Codable {
        save(item, key: key.userDefaultsKey)
    }
    
    public func read<T>(key: Keys, type: T.Type) -> T? where T : Codable {
        return read(key: key.userDefaultsKey, type: type)
    }
    
    public func delete(key: Keys) {
        delete(key: key.userDefaultsKey)
    }
    
    
    //MARK: Private API
    private func save<T>(_ item: T, key: String) where T : Codable {
        guard let data = try? JSONEncoder().encode(item) else {
            debugPrint("❌ Couldn't save item for key: \(key) in userDefaults, Encoding error")
            return
        }
        
        UserDefaults.standard.set(data, forKey: key)
    }
    
    private func read<T>(key: String, type: T.Type) -> T? where T : Codable {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        
        guard let decodedItem = try? JSONDecoder().decode(type, from: data) else {
            debugPrint("❌ Couldn't read item for key: \(key) in userDefaults, Decoding error")
            return nil
        }
        return decodedItem
    }
    
    private func delete(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
}
