//
//  
//  TodoListMidterm
//
//  Created by Cory on 3/13/22.
//

import Foundation


class TodoList: ObservableObject {
  
  @Published var items = [
    TodoListItem(text: "Walk the dog", isComplete: false),
    TodoListItem(text: "Brush my teeth", isComplete: false),
    TodoListItem(text: "Learn iOS development", isComplete: true),
    TodoListItem(text: "Soccer practice", isComplete: false),
    TodoListItem(text: "Eat ice cream", isComplete: true),
  ]
    
  init() {
    print("Documents directory is: \(documentsDirectory())")
    print("Data file path is: \(dataFilePath())")
    loadListItems()
  }
  
  func printChecklistContents() {
    for item in items {
      print(item)
    }
    print("===================")
  }

  func deleteListItem(whichElement: IndexSet) {
    items.remove(atOffsets: whichElement)
    printChecklistContents()
    saveListItems()
  }


  func documentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory,
                                          in: .userDomainMask)
    return paths[0]
  }

  func dataFilePath() -> URL {
    return documentsDirectory().appendingPathComponent("TodoListMidterm.plist")
  }
    
  func saveListItems() {
        
      let encoder = PropertyListEncoder()
      do {
        let data = try encoder.encode(items)
        try data.write(to: dataFilePath(),
                  options: Data.WritingOptions.atomic)
      } catch {
        print("Error encoding item array: \(error.localizedDescription)")
      }
    }
    
  func loadListItems() {
        
      let path = dataFilePath()
      if let data = try? Data(contentsOf: path) {
        let decoder = PropertyListDecoder()
        do {
          items = try decoder.decode([TodoListItem].self,
                                     from: data)
        } catch {
          print("Error decoding item array: \(error.localizedDescription)")
        }
      }
    }  
}




