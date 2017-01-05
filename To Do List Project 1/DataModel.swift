//
//  ToDoDataModel.swift
//  To Do List Project 1
//
//  Created by Richel Cuyler on 11/16/16.
//  Copyright © 2016 Richel Cuyler. All rights reserved.
//

import Foundation
import UIKit
import Firebase



class List {
    
    var listName: String
    var tasks = [Task]()
    var ref: FIRDatabaseReference?
    
    init(listName: String) {
        self.listName = listName
    }
    
    init(snapshot: FIRDataSnapshot) {
        listName = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        tasks = snapshotValue["tasks"] as! [AnyObject] as! [Task]
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "listNAme": listName,
            "tasks": tasks
        ]
    }
    
}


var toDoLists = [List]()



class Task {
    
    var taskName: String
    var taskDescription: String
    var ref: FIRDatabaseReference?
    
    init(taskName: String, taskDescription: String, date: String = "") {
        self.taskName = taskName
        self.taskDescription = taskDescription
    }
    
    init(snapshot: FIRDataSnapshot) {
        taskName = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        taskDescription = snapshotValue["taskDescription"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "taskName": taskName,
            "taskDescription": taskDescription
        ]
    }
}

