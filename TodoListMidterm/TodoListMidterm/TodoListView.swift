//
//  TodoListView.swift
//  TodoListMidterm
//
//  Created by Cory on 3/13/22.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var todoList = TodoList()
    @State var newTodoListItemVisible = false
    
    var body: some View {
      NavigationView {
        List {
          ForEach(todoList.items) { index in
            TodoListRowView(todoListItem: self.$todoList.items[index])
          }
          .onDelete(perform: todoList.deleteListItem)
        }
        .navigationBarItems(
            leading: Button(action: { self.newTodoListItemVisible = true
          }) {
            HStack {
              Image(systemName: "plus.circle.fill")
              Text("Add item")
            }
          },
           trailing: EditButton()
        )
        .navigationBarTitle("Todo List", displayMode: .inline)
        .onAppear() {
          self.todoList.printChecklistContents()
          self.todoList.saveListItems()
        }
      }
      .sheet(isPresented: $newTodoListItemVisible) {
        AddItemView(todoList: self.todoList)
      }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
