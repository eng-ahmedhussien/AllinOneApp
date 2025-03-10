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
    let userService = UserApiClient()
    @Published var users: [Datum] = []
    
//    init(userService: UserApiProtocol) {
//        self.userService = userService
//    }
    
    
    //MARK: async

    func fetchUsers() async {
        do {
            let users = try await userService.getUsers()
            
            DispatchQueue.main.async {
                self.users = users?.data ?? []
                self.state = .loaded
            }
        } catch {
            DispatchQueue.main.async {
                self.state = .error(error.localizedDescription)
            }
        }
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
