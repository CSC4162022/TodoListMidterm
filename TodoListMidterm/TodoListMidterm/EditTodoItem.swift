//
//
//  TodoListMidterm
//

import Foundation
import SwiftUI

struct EditTodoItemView: View {

  @Binding var todoListItem: TodoListItem

  var body: some View {
    Form {
        HStack{
            TextField("item", text: $todoListItem.text)
             Button(action: { todoListItem.isComplete.toggle() }) {
                 Image(systemName: todoListItem.isComplete ? "largecircle.fill.circle" : "circle")
                 .renderingMode(.original)
                 .foregroundColor(Color.black)
             }
        }
    }
  }
}

struct EditChecklistItemView_Previews: PreviewProvider {
  static var previews: some View {
    EditTodoItemView(todoListItem: .constant(TodoListItem(text: "Sample item")))
  }
}
