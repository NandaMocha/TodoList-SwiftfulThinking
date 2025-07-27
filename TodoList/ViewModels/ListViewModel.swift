//
//  ListViewModel.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import SwiftUI

@Observable class ListViewModel {
    var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let todoItems = [
            ItemModel(title: "First Title", isCompleted: false),
            ItemModel(title: "Second Title", isCompleted: true),
            ItemModel(title: "Third Title", isCompleted: false),
            ItemModel(title: "Fourth Title", isCompleted: true)
        ]
        
        items.append(contentsOf: todoItems)
    }
    
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func onMove(indexSet: IndexSet, index: Int) {
        items.move(fromOffsets: indexSet, toOffset: index)
    }
}
