//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Terrence K on 2/26/15.
//  Copyright (c) 2015 Lytenight. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var myManager = ItemsManager()
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        
        let item = myManager[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        if item.isComplete {
            cell.accessoryType = .Checkmark
            cell.imageView?.image = item.photo
        } else {
            cell.accessoryType = .None
            cell.imageView?.image = nil
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myManager.count
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addViewController = segue.sourceViewController as AddViewController
            if let newItem = addViewController.newItem {
                myManager.append(newItem)
                myManager.save()
                
                let indexPath = NSIndexPath(forRow: myManager.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = .Camera
        } else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let indexPath = tableView.indexPathForSelectedRow() {
            let selectedItem = myManager[indexPath.row]
            let photo = info[UIImagePickerControllerOriginalImage] as UIImage
            selectedItem.photo = photo
            
            myManager.save()
            
            dismissViewControllerAnimated(true, completion: {
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            })
        }
        
    }
    
}
