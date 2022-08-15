//
//  TodoListApp.swift
//  TodoList
//
//  Created by Steven Wijaya on 19.07.2022.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
