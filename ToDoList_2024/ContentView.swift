//
//  ContentView.swift
//  ToDoList_2024
//
//  Created by Sanjida Orpi on 5/19/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                     .font(.system(size: 40))
                     .fontWeight(.black)
                Spacer()
                
                Button {
                    withAnimation {
                        self.showNewTask = true
                    }
                } label: {
                    Text("+")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                }
            }
            .padding(30)
            Spacer()
            
            List {
                ForEach (toDos) { toDoItem in
                        Text(toDoItem.title)
                    }
                .onDelete(perform: deleteToDo)
            }
            .listStyle(.plain)
        }
        .padding()
        
        if showNewTask {
            NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
        }
    }
    
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
}
