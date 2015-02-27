//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Terrence K on 2/26/15.
//  Copyright (c) 2015 Lytenight. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    
    var itemsList: [ScavengerHuntItem] = [
        ScavengerHuntItem(name: "Cat"),
        ScavengerHuntItem(name: "Bird"),
        ScavengerHuntItem(name: "Moose")
    ]
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        
        let item = itemsList[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addViewController = segue.sourceViewController as AddViewController
            if let newItem = addViewController.newItem {
                self.itemsList += [newItem]
                
                let indexPath = NSIndexPath(forRow: itemsList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
}
