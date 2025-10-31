//
//  ItemModel.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool
    var name: String
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.name = ""
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
