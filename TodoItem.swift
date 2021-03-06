//
//  TodoItem.swift
//  ToDoList
//
//  Created by Daniel Warner on 10/20/15.
//  Copyright © 2015 Daniel Warner. All rights reserved.
//

import UIKit
import TwitterJSON

class TodoItem: NSObject, NSCoding {
    
    var todo: String?
    var dueDate: NSDate?
    var image: UIImage?
    var id: Int64?
    
    override init() {
        super.init()
    }
    
    required init(coder aDecoder:NSCoder) {
        super.init()
        if let message = aDecoder.decodeObjectForKey("message") as? String {
            self.todo = message
        }
        if let date = aDecoder.decodeObjectForKey("dueDate") as? NSDate {
            self.dueDate = date
            
        }
        if let img = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image = img
        }
        let identifier = aDecoder.decodeInt64ForKey("identifier")
        if identifier != 0 {
            self.id = identifier
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let message = self.todo {
            aCoder.encodeObject(message, forKey: "message")
        }
        if let date = self.dueDate {
            aCoder.encodeObject(date, forKey: "dueDate")
        }
        if let image = self.image {
            aCoder.encodeObject(image, forKey: "image")
        }
        if let identifier = self.id {
            aCoder.encodeInt64(identifier, forKey: "identifier")
        }
    }
    
    
}
