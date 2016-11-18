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
        let newList = List(listName: ListName.text!)
        toDoLists.append(newList)
        ListName.resignFirstResponder()
        ListName.text = ""
        ListOfListsTableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoLists.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListOfListsTableViewCell
        
        let myRow = indexPath.row
        let nameOfList = toDoLists[myRow]
        
        listCell.textLabel?.text = nameOfList.listName
        
        if indexPath.row % 2 == 0 {
            listCell.backgroundColor = UIColor.lightGray
        }
        return listCell
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoLists.remove(at: indexPath.row)
            ListOfListsTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let listVC = segue.destination as! NewListViewController
        listVC.list = toDoLists[ListOfListsTableView.indexPathForSelectedRow!.row]
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


