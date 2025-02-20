//
//  Netowking.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI
import Combine


struct networkingtest: View {

    @StateObject var userVM = UserVM()
    @State var cancellables = Set<AnyCancellable>()
    @State var users : [Datum]?
    var body: some View {
        
        VStack {
            switch userVM.state {
            case .loading:
                ProgressView("Loading...")
                    .padding()
            case .loaded:
                List(userVM.users, id: \.self) { item in
                    Text(item.firstName ?? "")
                }.listStyle(.plain)
//                    ForEach(users ?? [], id: \.id) { user in
//                        Text(user.firstName ?? "")
//                    }
            case .empty:
                Text("No data available.")
                    .padding()
            case .error(let message):
                Text("Error: \(message)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
//        .onAppear{
//            userVM.fetchUsers()
//        }
        .task {
            userVM.fetchUsers()
        }
        .padding()
    }
}

#Preview {
    networkingtest()
}
