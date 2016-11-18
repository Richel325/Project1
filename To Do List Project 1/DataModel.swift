//
//  ToDoDataModel.swift
//  To Do List Project 1
//
//  Created by Richel Cuyler on 11/16/16.
//  Copyright © 2016 Richel Cuyler. All rights reserved.
//

import Foundation
import UIKit


class List {
    
    var listName: String
    var tasks = [Task]()
    
    init(listName: String) {
        self.listName = listName
    }
}

var toDoLists = [List]()


class Task {
    
    var taskName: String
    var taskDescription: String
    
    init(taskName: String, taskDescription: String) {
        self.taskName = taskName
        self.taskDescription = taskDescription
    }
}

