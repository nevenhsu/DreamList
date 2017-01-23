//
//  ItemType+CoreDataProperties.swift
//  DreamList
//
//  Created by Neven on 22/01/2017.
//  Copyright © 2017 Neven. All rights reserved.
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
