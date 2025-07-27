//
//  ListRowView.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .gray)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    var items: [ItemModel] = [
        ItemModel(title: "First Title", isCompleted: false),
        ItemModel(title: "Second Title", isCompleted: false),
        ItemModel(title: "Third Title", isCompleted: false),
        ItemModel(title: "Fourth Title", isCompleted: false),
        
    ]

    Group {
        ForEach(items) { item in
            ListRowView(item: item)
        }
    }
}
