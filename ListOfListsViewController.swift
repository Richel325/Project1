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
    @IBOutlet weak var newListLabel: UILabel!
    
    @IBAction func NewListButton(_ sender: UIButton) {
        let newList = List(name: newListLabel.text!, description: "")
        DataController.sharedinstance.list.append(newList)
        newListLabel.resignFirstResponder()
        ListOfListsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataController.sharedinstance.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        
        let myRow = indexPath.row
        let list = DataController.sharedinstance.list[myRow]
        
        return listCell
        //code in here for if statement to make every other row light gray instead of white using "list" from above
        if indexPath.row % 2 == 0 {
            listCell.backgroundColor = UIColor.lightGray
        }
        
        
//        var currentList: List?
        
     func viewDidLoad() {
            super.viewDidLoad()
            
//            guard let item = currentList else { return }
//            newListLabel.text = item.name
//            
//            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                if segue.identifier == "newListToListItem" {
//                    let listViewController = segue.destination as! ListOfListsViewController
//                    let index = ListOfListsTableView.indexPathForSelectedRow?.row
//                    let listLine = DataController.sharedinstance.list[index!]
//                    listViewController.currentList = listLine
                }
                
            }
            
        }
