//
//  ListDetailViewController.swift
//  To Do List Project 1
//
//  Created by Richel Cuyler on 11/16/16.
//  Copyright © 2016 Richel Cuyler. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {

    @IBOutlet weak var ToDoItem: UILabel!
    @IBOutlet weak var ItemDescriptionDetail: UITextView!
    
    
    var currentItem: List?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let item = currentItem else { return }
        
        ToDoItem.text = item.name
        ItemDescriptionDetail.text = item.description

  
    }
    
    
}
