//
//  DBManager.swift
//  VDB
//
//  Created by Puneet Gurtoo on 1/31/19.
//  Copyright © 2019 Puneet Gurtoo. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    private var database:Realm
    static let sharedInstance = DBManager()
    
    private init() {
        database = try! Realm()
    }
    
    func getDataFromDB() -> Results<Home> {
        let results: Results<Home> = database.objects(Home.self)
        return results
    }
    func addData(objects:[Home]) {
        try! database.write {
            database.add(objects, update: true)
            print("Added new sequence")
        }
    }
    func addData(object: Home) {
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }
    func deleteAllFromDatabase()  {
        try! database.write {
            database.deleteAll()
        }
    }
    func deleteFromDb(object: Home)   {
        try! database.write {
            database.delete(object)
        }
    }
}
