//
//  ItemType+CoreDataProperties.swift
//  iYarn
//
//  Created by Jason Larkin on 10/3/16.
//  Copyright © 2016 Jason Larkin. All rights reserved.
//

import Foundation
import CoreData

extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
