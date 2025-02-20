//
//  UserService.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI
import Combine

protocol UserApiProtocol {
    func getUsers() -> AnyPublisher<User, Error>
    func getUserById(id:String) -> AnyPublisher<Datum, Error>
    
    //MARK: async
    func getUsers() async throws -> User?
}

class UserApiClient: UserApiProtocol {
    let apiClient = URLSessionAPIClient<UserEndpoints>()
    
    func getUsers() -> AnyPublisher<User, Error> {
        apiClient.request(.getUsers)
    }
    func getUserById(id:String) -> AnyPublisher<Datum, Error> {
        apiClient.request(.getUserById(id: id))
    }
    
    //MARK: async
    func getUsers() async throws -> User? {
        try await apiClient.request(.getUsers)
    }
    
    
}
