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
    @IBOutlet weak var newListItemLabel: UILabel!
    
    @IBAction func NewItemInList(_ sender: UIButton) {
        let newListItem = List(name: newListItemLabel.text!, description: "")
        DataController.sharedinstance.newItem.append(newListItem)
        newListItemLabel.resignFirstResponder()
        NewListTableView.reloadData()
    }
    


    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataController.sharedinstance.newItem.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let myRow = indexPath.row
        let newListItem = DataController.sharedinstance.newItem[myRow]
        
        if indexPath.row % 2 == 0 {
            itemCell.backgroundColor = UIColor.lightGray
    }
        return itemCell
    }
    
        var currentListItem: List?
        
     override func viewDidLoad() {
            super.viewDidLoad()
            
            guard let item = currentListItem else { return }
            newListItemLabel.text = item.name
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
