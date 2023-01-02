//
//  ListView.swift
//  SwiftUIDemo
//
//  Created by Bharath Raj Kumar Boopathy on 02/01/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject private var viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        List(viewModel.peoples) { people in
            VStack(alignment: .leading) {
                ItemView(key: "Name", value: people.name)
                ItemView(key: "Favorite Language", value: people.language ?? "None")
            }
        }
    }
}
