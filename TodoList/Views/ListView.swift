//
//  ListView.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import SwiftUI

struct ListView: View {
    @Environment(ListViewModel.self) private var viewModel
    
    var body: some View {
        List {
            ForEach(viewModel.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: viewModel.deleteItem)
            .onMove(perform: viewModel.onMove)
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environment(ListViewModel())
}

