//
//  ListViewModel.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import SwiftUI

@Observable class ListViewModel {
    
    var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    var itemsKey: String = "item_list"
    init() {
        getItems()
    }
    
    func getItems() {
        
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
