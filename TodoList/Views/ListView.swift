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
        ZStack {
            if viewModel.items.isEmpty {
                VStack {
                    Spacer()
                    EmptyView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                }
                
            } else {
                showItemList()
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            if !viewModel.items.isEmpty {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        AddView()
                    }
                    .tint(.accentColor)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .tint(.accentColor)
                }
            }
        }
        .listStyle(.plain)
    }
    
    func showItemList() -> some View {
        return List {
                    ForEach(viewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    viewModel.updateItem(itm: item)
                                }
                            }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.onMove)
                }
    }
    
}

#Preview {
    NavigationView {
        ListView()
    }
    .environment(ListViewModel())
}

