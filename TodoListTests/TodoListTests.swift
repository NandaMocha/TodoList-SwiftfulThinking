//
//  TodoListTests.swift
//  TodoListTests
//
//  Created by Nanda Mochammad on 14/10/25.
//

import Foundation
import Testing
@testable import TodoList

@Suite("ListViewModel – Given/When/Then")
struct ListViewModelTests {

    // MARK: - Helpers

    /// Key harus sama dengan di produksi
    private let itemsKey = "item_list"

    private func clearPersistedItems() {
        UserDefaults.standard.removeObject(forKey: itemsKey)
    }

    private func persist(_ items: [ItemModel]) throws {
        let data = try JSONEncoder().encode(items)
        UserDefaults.standard.set(data, forKey: itemsKey)
    }

    private func readPersistedItems() throws -> [ItemModel] {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey)
        else { return [] }
        return try JSONDecoder().decode([ItemModel].self, from: data)
    }
    
    // MARK: - Tests
    @Test("addItem to viewModel")
    func addItemToViewModel() throws {
        clearPersistedItems()
        
        let viewModel = ListViewModel()
        viewModel.itemsKey = itemsKey

        viewModel.addItem(title: "A")
        viewModel.addItem(title: "B")
        viewModel.addItem(title: "C")
        
        #expect(viewModel.items.map(\.title) == ["A", "B", "C"])
    }

    @Test("onMove(_:to:) reorders items and persists")
    func onMove_reordersAndPersists() throws {
        // Given: urutan A, B, C
        clearPersistedItems()
        let viewModel = ListViewModel()
        viewModel.itemsKey = itemsKey
        
        viewModel.addItem(title: "A")
        viewModel.addItem(title: "B")
        viewModel.addItem(title: "C")

        // When: pindahkan A (index 0) ke setelah C (toOffset 3)
        viewModel.onMove(indexSet: IndexSet(integer: 0), index: 3)

        // Then: urutan menjadi B, C, A dan tersimpan
        #expect(viewModel.items.map(\.title) == ["B", "C", "A"])
        let disk = try readPersistedItems()
        #expect(disk.map(\.title) == ["B", "C", "A"])
    }
}
