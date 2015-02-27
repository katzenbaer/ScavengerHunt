//
//  ItemsManager.swift
//  ScavengerHunt
//
//  Created by Terrence K on 2/26/15.
//  Copyright (c) 2015 Lytenight. All rights reserved.
//

import Foundation
import UIKit

class ItemsManager {
    private var items = [ScavengerHuntItem]()
    var count: Int {
        get {
            return items.count   
        }
    }
    
    lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        let archiveURL = documentsDirectoryURLs.first!.URLByAppendingPathComponent("ScavengerHuntItems", isDirectory: false)
        
        return archiveURL.path!
    }()
    
    init() {
        unarchiveSavedItems()
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(items, toFile: archivePath)
    }
    
    private func unarchiveSavedItems() {
        if NSFileManager.defaultManager().fileExistsAtPath(archivePath) {
            let savedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as [ScavengerHuntItem]
            items += savedItems
        }
    }
    
    subscript(i: Int) -> ScavengerHuntItem {
        return items[i]
    }
    
    func append(item: ScavengerHuntItem) {
        items += [item]
    }
}
