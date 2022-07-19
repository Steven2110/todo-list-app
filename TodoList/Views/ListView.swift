//
//  ListView.swift
//  TodoList
//
//  Created by Steven Wijaya on 19.07.2022.
//

import SwiftUI

struct ListView: View {
    @State var items : [String] = [
        "This is the first item",
        "Second one",
        "Third"
    ]
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
