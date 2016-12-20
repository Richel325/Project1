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

class Model {
    
    static let shared = Model()
    private init (){}
    
    let key = "persisted-list"
    func persistListsToDefaults() {
        let savedData = NSKeyedArchiver.archivedData(withRootObject: toDoLists)
        UserDefaults.standard.set(savedData, forKey: key)
    }
    
    func loadPersistedListsFromDefaults() {
        if let savedData = UserDefaults.standard.object(forKey: key) as? Data {
            let newToDoLists = NSKeyedUnarchiver.unarchiveObject(with: savedData) as! [List]
            toDoLists = newToDoLists
        }
    }
}


class List: NSObject, NSCoding {
    
    private struct Keys {
        static let listName = "listName"
        static let tasks = "tasks"
    }
    
    var listName: String
    var tasks = [Task]()
    
    init(listName: String) {
        self.listName = listName
    }
    
    required init?(coder aDecoder: NSCoder) {
        listName = aDecoder.decodeObject(forKey: Keys.listName) as! String
        tasks = aDecoder.decodeObject(forKey: Keys.tasks) as! [Task]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(listName, forKey: Keys.listName)
        aCoder.encode(tasks, forKey: Keys.tasks)
    }
}

var toDoLists = [List]()



class Task: NSObject, NSCoding {
    
    private struct Keys {
        static let taskName = "taskName"
        static let taskDescription = "taskDescription"
    }
    
    var taskName: String
    var taskDescription: String
    var date: String
    var ref: FIRDatabaseReference?
    
    init(taskName: String, taskDescription: String, date: String = "") {
        self.taskName = taskName
        self.taskDescription = taskDescription
        self.date = date
    }
    
    init(snapshot: FIRDataSnapshot) {
        taskName = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        taskDescription = snapshotValue["taskDescription"] as! String
        date = snapshotValue["date"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "taskDescription": taskDescription,
            "date": date
        ]
    }
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(
            taskName: aDecoder.decodeObject(forKey: Keys.taskName) as! String,
            taskDescription: aDecoder.decodeObject(forKey: Keys.taskDescription) as! String
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(taskName, forKey: Keys.taskName)
        aCoder.encode(taskDescription, forKey: Keys.taskDescription)
    }
}




extension Date {
    
    func format() -> String {
        return Format.shared.dateFormatter.string(from: self)
    }
}

class Format {
    
    static let shared = Format()
    let dateFormatter = DateFormatter()
    private init() {
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
    }
}


