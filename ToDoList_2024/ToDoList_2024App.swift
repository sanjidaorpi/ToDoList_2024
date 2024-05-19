//
//  ToDoList_2024App.swift
//  ToDoList_2024
//
//  Created by Sanjida Orpi on 5/19/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoList_2024App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
