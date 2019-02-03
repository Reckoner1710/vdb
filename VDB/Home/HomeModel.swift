//
//  HomeModel.swift
//  VDB
//
//  Created by Puneet Gurtoo on 1/31/19.
//  Copyright © 2019 Puneet Gurtoo. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Home:Object, Mappable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var descriptionText = ""
    @objc dynamic var language = ""
    @objc dynamic var openIssues = 0
    @objc dynamic var watchers = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    override static func primaryKey() -> String? {
        return "id"
    }
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        descriptionText <- map["description"]
        language <- map["language"]
        openIssues <- map["open_issues"]
        watchers <- map["watchers"]
    }
}

