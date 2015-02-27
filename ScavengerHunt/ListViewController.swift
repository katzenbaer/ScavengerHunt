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
    
    var itemsList: [ScavengerHuntItem] = []
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = itemsList[indexPath.row].name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
}
