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

    
    @IBAction func NewItemInList(_ sender: UIButton) {
        let newListItem = List(name: NewListItem.text!, description: "")
        DataController.sharedinstance.newItem.append(newListItem)
        NewListItem.resignFirstResponder()
        NewListTableView.reloadData()
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataController.sharedinstance.newItem.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! NewListTableViewCell
        let myRow = indexPath.row
        let nameOfNewItem = DataController.sharedinstance.newItem[myRow]
        itemCell.newListItemCellLabel.text = nameOfNewItem.name
        
        
        if indexPath.row % 2 == 0 {
        itemCell.backgroundColor = UIColor.lightGray
        
        }
    return itemCell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataController.sharedinstance.newItem.remove(at: indexPath.row)
            NewListTableView.reloadData()
        }
    }
    
        var currentListItem: List?
        
    override func viewDidLoad() {
            super.viewDidLoad()
        
            guard let item = currentListItem else { return }
            NewListItem.text = item.name
        }
        
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "newItemCellToListDetail" {
                let itemDetailViewController = segue.destination as! ListDetailViewController
                let index = NewListTableView.indexPathForSelectedRow?.row
                let listItem = DataController.sharedinstance.newItem[index!]
                itemDetailViewController.currentItem = listItem
            }
}

}
