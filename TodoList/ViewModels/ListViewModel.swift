//
//  ViewModel.swift
//  TodoList
//
//  Created by Steven Wijaya on 11.08.2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItem = [
            ItemModel(title: "This is the first item", isCompleted: false),
            ItemModel(title: "Second one", isCompleted: true),
            ItemModel(title: "Third", isCompleted: false)
        ]
        items.append(contentsOf: newItem)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
        
    func moveItem(from: IndexSet, newOffset: Int) {
        items.move(fromOffsets: from, toOffset: newOffset)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateComplete(item: ItemModel) {        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
        
    }
}
