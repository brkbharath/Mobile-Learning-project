//
//  PeopleModel.swift
//  SwiftUIDemo
//
//  Created by Bharath Raj Kumar Boopathy on 02/01/23.
//

import Foundation

struct Peoples: Decodable {
    let peoples: [People]
    
    private enum CodingKeys: String, CodingKey {
        case peoples = "people"
    }
}

struct People: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let language: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case language
    }
}
