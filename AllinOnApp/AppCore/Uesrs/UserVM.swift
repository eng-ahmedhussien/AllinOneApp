//
//  UserVM.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI
import Combine

class UserVM : ObservableObject{
    
    private var cancellables = Set<AnyCancellable>()
    
    let userService = UserApiClien()
    @Published var users: User?
    
//    init(userService: UserApiProtocol) {
//        self.userService = userService
//    }
    
    func fetchUsers() {
        userService.getUsers()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
                
            }, receiveValue: {[weak self] data in
                self?.users = data
            }).store(in: &cancellables)
    }
}
