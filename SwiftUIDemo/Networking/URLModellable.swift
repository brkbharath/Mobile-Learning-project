//
//  URLModellable.swift
//  SwiftUIDemo
//
//  Created by Bharath Raj Kumar Boopathy on 02/01/23.
//

import Foundation

protocol RequestModellable {
    var path: String { get }
    var baseUrl: String { get }
    var httpMethod: HTTPMethod { get }
}

enum HTTPMethod {
    case GET
    case POST
}

extension RequestModellable {
    func urlRequest() -> URLRequest? {
        guard let url = URL(string: "\(baseUrl)\(path)") else { return nil }
        return URLRequest(url: url)
    }
}
