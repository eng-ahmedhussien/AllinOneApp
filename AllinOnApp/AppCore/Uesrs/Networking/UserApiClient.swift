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
}

class UserApiClien: UserApiProtocol {
    let apiClient = URLSessionAPIClient<UserEndpoints>()
    
    func getUsers() -> AnyPublisher<User, Error> {
        apiClient.request(.getUsers)
    }
    
    func getUserById(id:String) -> AnyPublisher<Datum, Error> {
        apiClient.request(.getUserById(id: id))
    }
    
}
