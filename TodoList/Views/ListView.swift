//
//  ListView.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import SwiftUI

struct ListView: View {
    @State var item: [ItemModel] = [
        ItemModel(title: "First Title", isCompleted: false),
        ItemModel(title: "Second Title", isCompleted: true),
        ItemModel(title: "Third Title", isCompleted: false),
        ItemModel(title: "Fourth Title", isCompleted: true),
        
    ]
    
    var body: some View {
        List {
            ForEach(item) { item in
                ListRowView(item: item)
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                NavigationLink("Edit") {
                    
                }

            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}

