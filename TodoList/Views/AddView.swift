//
//  AddView.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import SwiftUI

struct AddView: View {
    @State var textFieldValue: String = ""
    
    var body: some View {
        ScrollView {
            TextField("Type something here", text: $textFieldValue)
                .padding(.horizontal)
                .frame(height: 55)
                .background(
                    Color.gray
                        .opacity(0.3)
                        .clipShape(.rect(cornerRadius: 10)))
                .padding(.horizontal)
            
            Button(
                action: {
                
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 15)
                }
            )
            .padding(.horizontal)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .controlSize(.large)
        }
        .navigationTitle("Add an Item ✏️")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
