//
//  NewListViewController.swift
//  To Do List Project 1
//
//  Created by Richel Cuyler on 11/16/16.
//  Copyright © 2016 Richel Cuyler. All rights reserved.
//

import UIKit

class NewListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var NewListTableView: UITableView!
    @IBOutlet weak var NewListItem: UITextField!

    var list: List!
    
    @IBAction func NewItemInList(_ sender: UIButton) {
        let newListItem = Task(taskName: NewListItem.text!, taskDescription: "")
        list.tasks.append(newListItem)
        NewListItem.resignFirstResponder()
        //Model.shared.persistListsToDefaults()
        NewListItem.text = ""
        NewListTableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.tasks.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! NewListTableViewCell
        let myRow = indexPath.row
        let nameOfNewItem = list.tasks[myRow]
        itemCell.newListItemCellLabel.text = nameOfNewItem.taskName
        if indexPath.row % 2 == 0 {
        itemCell.backgroundColor = UIColor.lightGray
        }
    return itemCell
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.tasks.remove(at: indexPath.row)
            //Model.shared.persistListsToDefaults()
            NewListTableView.reloadData()
        }
    }
    
    
    
    var currentListItem: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = currentListItem else { return }
        NewListItem.text = item.taskName
        //Model.shared.loadPersistedListsFromDefaults()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItemCellToListDetail" {
            let itemDetailViewController = segue.destination as! ListDetailViewController
            let index = NewListTableView.indexPathForSelectedRow?.row
            let listItem = list.tasks[index!]
            itemDetailViewController.currentItem = listItem
        }
    }
    
}

