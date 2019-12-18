//
//  AssociatedObjects.swift
//  RecordingButton
//
//  Created by shintot on 2019/12/17.
//  Copyright © 2019 Mates Inc. All rights reserved.
//

import Foundation

class AssociatedObjects: NSObject {
    var dictionary = [String: Any]()
    
    subscript(key: String) -> Any? {
        get { return self.dictionary[key] }
        set { self.dictionary[key] = newValue }
    }
}
