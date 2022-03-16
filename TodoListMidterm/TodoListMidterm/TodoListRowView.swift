//
//  TodoListMidterm
//
//

import SwiftUI

struct TodoListRowView: View {
    
    @Binding var todoListItem: TodoListItem
    
    var body: some View {
        NavigationLink(destination: EditTodoItemView(todoListItem: $todoListItem)) {
          HStack {
            Text(todoListItem.isComplete ? Image("radioComplete") : Image( "radioIncomplete"))
            Spacer()
            Text(todoListItem.text)
          }
        }
    }
}
    

struct TodoListRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListRowView(todoListItem: .constant(TodoListItem(text: "Sample item")))
    }
}


