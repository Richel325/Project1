//
//  ListOfListsViewController.swift
//  To Do List Project 1
//
//  Created by Richel Cuyler on 11/16/16.
//  Copyright © 2016 Richel Cuyler. All rights reserved.
//

import UIKit

class ListOfListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var ListOfListsTableView: UITableView!
    @IBOutlet weak var ListName: UITextField!
    
    
    @IBAction func NewListButton(_ sender: UIButton) {
        let newList = List(name: ListName.text!, description: "")
        DataController.sharedinstance.list.append(newList)
        ListName.resignFirstResponder()
        ListOfListsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataController.sharedinstance.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListOfListsTableViewCell
        
        let myRow = indexPath.row
        let nameOfList = DataController.sharedinstance.list[myRow]
        
        listCell.textLabel?.text = nameOfList.name
        
        if indexPath.row % 2 == 0 {
            listCell.backgroundColor = UIColor.lightGray
        }
        
        return listCell
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataController.sharedinstance.list.remove(at: indexPath.row)
            ListOfListsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        }
        
    }
    

