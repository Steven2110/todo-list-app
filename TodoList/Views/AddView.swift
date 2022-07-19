//
//  AddView.swift
//  TodoList
//
//  Created by Steven Wijaya on 19.07.2022.
//

import SwiftUI

struct AddView: View {
    @State var textFieldTitle : String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here....", text: $textFieldTitle)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(red: 0.873, green: 0.873, blue: 0.87))
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(17)
        }
        .navigationTitle("Add an item ✍️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
