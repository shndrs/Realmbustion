//
//  DBDataSource.swift
//  HaveFunWithRealm
//
//  Created by NP2 on 6/27/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation

public protocol DBDataSource: AnyObject {
    
    associatedtype Realmject
    func connect(actionType: CRUD,
                 item: Realmject,
                 newItem: Realmject?,
                 completionHandler: DBCallback?)
    func getItems() -> [Realmject]
    func getItem(with id: String) -> Realmject?
    
}
