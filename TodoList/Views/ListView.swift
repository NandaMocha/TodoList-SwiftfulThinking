//
//  ListView.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import SwiftUI

struct ListView: View {
    @State var item: [String] = [
        "First Title", "Second Title", "Third Title"
    ]
    
    var body: some View {
        List {
            ForEach(item, id: \.self) { item in
                ListRowView(title: item)
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

