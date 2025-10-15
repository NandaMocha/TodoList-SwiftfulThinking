//
//  AddView.swift
//  TodoList
//
//  Created by Nanda Mochammad on 27/07/25.
//

import SwiftUI

struct AddView: View {
    @Environment(ListViewModel.self) private var viewModel
    @Environment(\.dismiss) private var dismiss
    @State var textFieldValue: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    
    var body: some View {
        ScrollView {
            TextField("Type something here", text: $textFieldValue)
                .padding(.horizontal)
                .frame(height: 55)
                .background(
                    Color(UIColor.secondarySystemBackground)
                        .clipShape(.rect(cornerRadius: 10)))
                .padding(.horizontal)
            
            Button(
                action: saveItem, label: {
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
        .navigationTitle("Add an To-Do Task ✏️")
        .alert(isPresented: $showAlert, content: getAlert)
        
    }
    
    func saveItem() {
        if isValidValue() {
            viewModel.addItem(title: textFieldValue)
            dismiss()
        } else {
            showAlert.toggle()
            alertTitle = "Input is not valid"
            alertMessage = "Input should more that 3 characters"
        }
    }
    
    func isValidValue() -> Bool {
        return textFieldValue.count > 3
    }
}

extension AddView {
    func getAlert() -> Alert {
        return Alert(
                title: Text(alertTitle),
                message: Text(alertMessage))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environment(ListViewModel())
}
