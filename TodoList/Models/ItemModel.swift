//
//  ItemModel.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
