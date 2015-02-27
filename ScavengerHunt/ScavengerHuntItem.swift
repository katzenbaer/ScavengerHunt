//
//  ScavengerHuntItem.swift
//  ScavengerHunt
//
//  Created by Terrence K on 2/26/15.
//  Copyright (c) 2015 Lytenight. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject, NSCoding {
    
    let NameKey = "NameKey"
    let PhotoKey = "PhotoKey"
    
    let name: String
    var photo: UIImage?
    var isComplete: Bool {
        get {
            return photo != nil
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(NameKey) as String
        photo = aDecoder.decodeObjectForKey(PhotoKey) as? UIImage
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: NameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: PhotoKey)
        }
    }
    
}
