//
//  DBMan.swift
//  HaveFunWithRealm
//
//  Created by NP2 on 6/27/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation
import RealmSwift

final class DBMan: NSObject {
    
    let key = "CJqaK2AE1SApAt8Nv6wUr+GxgYydlukinEtGwDN6qyHJneXb/uv2bokNwidygsrpDye58jdOeh4j6FRtd2ZWFA=="
    private let identifyName: String
    
    public class var shared: DBMan {
        struct Static {
            static let instance = DBMan()
        }
        return Static.instance
    }

    private(set) lazy var realmConfiguration: Realm.Configuration = {
        var config = Realm.Configuration()
        let dbVersion: UInt64 = 1
        config.fileURL = config.fileURL!.deletingLastPathComponent()
            .appendingPathComponent("\(self.identifyName).realm")
        config.encryptionKey = Data.init(base64Encoded: key)
        config.schemaVersion = dbVersion
        return config
    }()
    private(set) lazy var realm: Realm = {
        return try! Realm(configuration: self.realmConfiguration)
    }()
       
    override init() {
        self.identifyName = String(key[..<key.index(key.startIndex, offsetBy: 13)])
    }
    
}
