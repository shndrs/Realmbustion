//
//  ViewController.swift
//  HaveFunWithRealm
//
//  Created by Sahand Raeisi on 1/6/19.
//  Copyright © 2019 Sahand Raeisi. All rights reserved.
//

import UIKit
import SHNDStuffs
import RealmSwift

class ViewController: UIViewController {

    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addDateToDb()
        retrieveDataFromDB()
    }
    
    private func addDateToDb() {
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        let myGuitar = Guitar()
        myGuitar.brand = "Skervesen"
        myGuitar.model = "Raptor 7 Floydrose"
        myGuitar.numberOfStrings = "7"
        
        
        try! realm.write {
            realm.add(myGuitar)
            
        }
    }
    
    private func retrieveDataFromDB() {
        
//        let res = realm.objects(Guitar.self)
//        print(res[2].model)
        
        let results = realm.objects(Guitar.self).filter("brand = 'Dean'")
        print(results)
        print(results.count )
        
    }


}

