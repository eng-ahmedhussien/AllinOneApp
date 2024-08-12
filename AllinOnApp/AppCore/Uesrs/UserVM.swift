//
//  UserVM.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI
import Combine

class UserVM : ObservableObject{
    
    private var cancellable = Set<AnyCancellable>()
    @Published var state: ViewState = .loading
    let userService = UserApiClien()
    @Published var users: [Datum] = []
    
//    init(userService: UserApiProtocol) {
//        self.userService = userService
//    }
    
    func fetchUsers() {
        userService.getUsers()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
                switch data {
                case .finished:
                    self.state = .loaded
                case .failure(let error):
                    self.state = .error(error.localizedDescription)
                }
            }, receiveValue: {[weak self] data in
                guard let usersData = data.data else {return}
                self?.users = usersData
                self?.state = .loaded
            }).store(in: &cancellable)
    }
}

//MARK: - ViewState
extension UserVM {
    enum ViewState {
            case loading
            case loaded
            case empty
            case error(String)
        }
}
