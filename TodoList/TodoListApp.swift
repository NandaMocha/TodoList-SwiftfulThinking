//
//  TodoListApp.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    @State private var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .navigationSplitViewStyle(.automatic)
            .environment(listViewModel)
        }
    }
}
