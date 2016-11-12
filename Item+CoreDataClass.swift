//
//  Item+CoreDataClass.swift
//  iYarn
//
//  Created by Jason Larkin on 10/3/16.
//  Copyright © 2016 Jason Larkin. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
 
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
}
