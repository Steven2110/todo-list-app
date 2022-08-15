//
//  AddView.swift
//  TodoList
//
//  Created by Steven Wijaya on 19.07.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldTitle : String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here....", text: $textFieldTitle)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(red: 0.873, green: 0.873, blue: 0.87))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save")
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
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldTitle)
            presentationMode.wrappedValue.dismiss()
            
        } else {
            
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldTitle.count < 3 {
            alertTitle = "New todo item must have at least 3 characters long!!! 😨"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        Alert(
            title: Text("Failed to add new item"),
            message: Text(alertTitle),
            dismissButton: .default(Text("Ok"))
        )
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
