//
//  PeopleRequest.swift
//  SwiftUIDemo
//
//  Created by Bharath Raj Kumar Boopathy on 02/01/23.
//

import Foundation

struct PeopleRequest: RequestModellable {
    var baseUrl: String {
        "https://gist.githubusercontent.com/"
    }
    
    var path: String {
        "russellbstephens/9e528b12fd1a45a7ff4e4691adcddf10/raw/5ec8ce76460e8f29c9b0f99f3bf3450b06696482/people.json"
    }
    
    var httpMethod: HTTPMethod {
        .GET
    }
}


