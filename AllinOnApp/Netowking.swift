//
//  Netowking.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI
import Combine


struct networkingtest: View {

    @State var userVM = UserVM()
    @State var cancellables = Set<AnyCancellable>()
    @State var users : User?
    var body: some View {
        VStack {
          
        }
        .onAppear{
            userVM.fetchUsers()
            guard let user = userVM.users else {return}
            print(user.data)
                
            
            
            
            
//            networking.getAll()
//                .receive(on: DispatchQueue.main)
//                .sink(receiveCompletion: { data in
//                    
//                }, receiveValue: { data in
//                    users = data
//                }).store(in: &cancellables)

        }
        .padding()
    }
}


//MARK: - newtorking
struct Url {
    static let shared = Url()
    let baseURL = "https://dummyapi.io/data/v1"
    let param  = [
        "app-id" : "62fb78b30fb89e62ca11c547"
    ]
    
    
    func getAllUsers()-> URL?{
        return URL(string: baseURL + "user")
    }
    func getAllPosts()-> URL?{
        return URL(string: baseURL + "post")
    }

}
                                        
class NetworkManager{
    
    private var cancellables = Set<AnyCancellable>()
    
    func getAll() -> AnyPublisher<User, Error> {
        
        guard let url = Url.shared.getAllUsers() else {return Fail(error: URLError(.badURL)).eraseToAnyPublisher()}
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = Url.shared.param
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: User.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}




// MARK: - User
struct User :Codable{
    let data: [Datum]?
    let total, page, limit: Int?
}

// MARK: - Datum
struct Datum :Codable{
    let id: String?
    let title: Title?
    let firstName, lastName: String?
    let picture: String?
}

enum Title: String,Codable {
    case miss
    case mr
    case mrs
    case ms
}
