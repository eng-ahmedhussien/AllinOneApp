//
//  APIEndpoint.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI


protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: Parameters? { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum APIError: Error {
    case invalidResponse
    case invalidData
}

enum Parameters {
    case requestNoParameters
    
//    case requestParameters(parameters: [String: Any], encoding: APIEncoding)
//    
//    case requestWithMultipart(parameters: [String: Any], multipartParamters: MultipartType)
}
