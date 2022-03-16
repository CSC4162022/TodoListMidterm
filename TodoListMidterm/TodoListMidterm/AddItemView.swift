//
//  TodoListMidterm
//
//

import SwiftUI

struct AddItemView: View {
    
    var todoList: TodoList
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
      VStack {
        Text("Add new item")
        Form {
          TextField("Enter new item name here", text: $newItemName)
          Button(action: {
            let newChecklistItem = TodoListItem(text: self.newItemName)
            self.todoList.items.append(newChecklistItem)
            self.todoList.printChecklistContents()
            self.todoList.saveListItems()
            self.presentationMode.wrappedValue.dismiss()
          }) {
            HStack {
              Image(systemName: "plus.circle.fill")
              Text("Add new item")
            }
          }
          .disabled(newItemName.count == 0)
        }
        Text("Swipe down to cancel.")
      }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(todoList: TodoList())
    }
}


