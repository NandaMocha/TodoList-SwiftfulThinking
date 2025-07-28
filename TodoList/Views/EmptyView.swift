//
//  EmptyView.swift
//  TodoList
//
//  Created by Nanda Mochammad on 28/07/25.
//

import SwiftUI

struct EmptyView: View {
    @State var animate: Bool = false
    
    let title: String =  "All Task is Done"
    let description: String = "Good job! Ready for next task 🔥"
    let image: String = "hand.thumbsup"

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Image(systemName: image)
                    .resizable()
                    .font(.largeTitle)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.gray)
                    
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(description)
                    .foregroundStyle(.gray)
                    .font(.callout)
                    .padding(.bottom, 16)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add New Task")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? .red : .accentColor)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                )
                .padding(.horizontal, animate ? 50 : 50)
                .shadow(
                    color: animate ? .red.opacity(0.7) : .accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .scrollDisabled(true)
            .padding()
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation (
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    EmptyView()
}
