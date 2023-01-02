//
//  DataService.swift
//  SwiftUIDemo
//
//  Created by Bharath Raj Kumar Boopathy on 02/01/23.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidUrl
    case statusCode(Int?)
    case decodingError
    case others(Error)
}

protocol DataServicable {
    func request<T: Decodable>(request: URLRequest, type: T.Type, decoder: JSONDecoder) -> AnyPublisher<T, Error>
}

struct DataService: DataServicable {
    func request<T: Decodable>(request: URLRequest, type: T.Type, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error>  {
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError { error in
                return NetworkError.others(error)
            }
            .eraseToAnyPublisher()
            .tryMap { (data, response) -> (data: Data, response: URLResponse) in
                guard let urlResponse = response as? HTTPURLResponse, (200..<300) ~= urlResponse.statusCode else {
                    throw NetworkError.statusCode(nil)
                }
                return (data, response)
            }
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
