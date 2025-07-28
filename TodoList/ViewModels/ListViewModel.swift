//
//  ListViewModel.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import SwiftUI

/*
 CRUD Function
 Create
 Read
 Update
 Delete
 */

@Observable class ListViewModel {
    
    var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "item_list"
    init() {
        getItems()
    }
    
    func getItems() {
//        let todoItems = [
//            ItemModel(title: "First Title", isCompleted: false),
//            ItemModel(title: "Second Title", isCompleted: true),
//            ItemModel(title: "Third Title", isCompleted: false),
//            ItemModel(title: "Fourth Title", isCompleted: true)
//        ]
        
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let todoItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
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
    
    func updateItem(itm: ItemModel) {
//        let index = items.firstIndex { item in
//            return item.id == itm.id
//        }
        
        if let index = items.firstIndex(where: {$0.id == itm.id}) {
            items[index] = itm.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
