//
//  ListViewModel.swift
//  SwiftUIDemo
//
//  Created by Bharath Raj Kumar Boopathy on 02/01/23.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    
    @Published var peoples: [People] = []
    
    private let service: DataService
    private var anyCancellable: AnyCancellable?
    init(service: DataService = DataService()) {
        self.service = service
        getPeopleList()
    }
    
    func getPeopleList() {
        guard let request = PeopleRequest().urlRequest() else { return }
        anyCancellable = service.request(request: request, type: Peoples.self)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { peoples in
                self.peoples = peoples.peoples
            })
    }
}
