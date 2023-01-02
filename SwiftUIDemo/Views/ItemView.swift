//
//  ItemView.swift
//  SwiftUIDemo
//
//  Created by Bharath Raj Kumar Boopathy on 02/01/23.
//

import SwiftUI

struct ItemView: View {
    let key: String
    let value: String
    var body: some View {
        HStack {
            Text("\(key):")
                .bold()
            Text(value)
        }
    }
}
