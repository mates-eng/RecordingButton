//
//  HasAssociatedObjects.swift
//  RecodingButton
//
//  Created by shintot on 2019/12/17.
//  Copyright © 2019 Mates Inc. All rights reserved.
//

import Foundation

protocol HasAssociatedObjects {
    var associatedObjects: AssociatedObjects { get }
}

private var AssociatedObjectsKey: UInt8 = 0

extension HasAssociatedObjects where Self: AnyObject {
    var associatedObjects: AssociatedObjects {
        guard let associatedObjects = objc_getAssociatedObject(self, &AssociatedObjectsKey) as? AssociatedObjects else {
            let associatedObjects = AssociatedObjects()
            objc_setAssociatedObject(self, &AssociatedObjectsKey, associatedObjects, .OBJC_ASSOCIATION_RETAIN)
            return associatedObjects
        }
        return associatedObjects
    }
}
