//
//  UserModel.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 02/03/2024.
//

import Foundation

// MARK: - User
struct User :Codable{
    let data: [Datum]?
    let total, page, limit: Int?
}

// MARK: - Datum
struct Datum :Codable,Hashable{
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
