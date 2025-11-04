//
//  UserService.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI
import Combine

protocol UserApiProtocol {
    //MARK: async
    func getUsers() async throws -> User?
    func getUserById(id:String) async throws -> Datum?
}

class UserApiClient: URLSessionAPIClient<UserEndpoints>, UserApiProtocol {
   /// can use let apiClient = URLSessionAPIClient<UserEndpoints>() or inherit from URLSessionAPIClient
    func getUsers() async throws -> User? {
        try await request(.getUsers)
    }
    
    func getUserById(id:String) async throws -> Datum? {
        try await request(.getUserById(id: id))
    }
    
    
}
