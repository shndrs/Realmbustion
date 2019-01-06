//
//  Guitar.swift
//  HaveFunWithRealm
//
//  Created by Sahand Raeisi on 1/6/19.
//  Copyright © 2019 Sahand Raeisi. All rights reserved.
//

import Foundation
import RealmSwift

class Guitar: Object {
    
    @objc dynamic var brand:String?
    @objc dynamic var model:String?
    @objc dynamic var numberOfStrings:String?
}
