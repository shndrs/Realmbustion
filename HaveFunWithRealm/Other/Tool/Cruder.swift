//
//  Cruder.swift
//  HaveFunWithRealm
//
//  Created by NP2 on 6/27/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation
import Foundation
import RealmSwift

final class Cruder<T: Object>: NSObject {
    
    private lazy var realm: Realm = {
        return DBMan.shared.realm
    }()
    
}

// MARK: - Methods

extension Cruder {
    
    public func connect(actionType: CRUD, item: T, newItem: T? = nil,
                        completionHandler: DBCallback?) {
        do {
            switch actionType {
            case .create, .update:
                try realm.write {
                    (newItem != nil) ?
                        self.update(item: item, newItem: newItem) : realm.add(item, update: .modified)
                }
            case .delete:
                try realm.write {
                    realm.delete(item)
                }
            default:
                break
            }
            completionHandler?(true, nil)
        } catch(let error) {
            completionHandler?(false, error)
        }
    }
    
    private func update(item: T, newItem: T?) {
        guard let new = newItem else {
            print(Strings.updateError.rawValue)
            return
        }
        realm.delete(item)
        realm.add(new)
    }
    
    @discardableResult
    public func getItems() -> [T] {
        let result = realm.objects(T.self)
        return Array(result)
    }
    
    @discardableResult
    public func getItem(with id: String) -> T? {
        let result = realm.object(ofType: T.self, forPrimaryKey: id)
        return result
    }
    
}
