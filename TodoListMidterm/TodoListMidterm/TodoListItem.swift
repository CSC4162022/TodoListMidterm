//
//  TodoListItem.swift
//  TodoListMidterm
//
//  Created by Cory on 3/13/22.
//

import Foundation


struct TodoListItem: Identifiable, Codable {
  
  var id = UUID()
  var text: String
  var isComplete: Bool = false

}
