//
//  MockHome.swift
//  VDB
//
//  Created by Puneet Gurtoo on 2/3/19.
//  Copyright © 2019 Puneet Gurtoo. All rights reserved.
//

import Foundation

struct MockHome
{
    struct Home
    {
        var id = 0
        var name = ""
        var descriptionText = ""
        var language = ""
        var openIssues = 0
    }
    let homeArray:[Home] = [Home.init(id: 0, name: "first", descriptionText: "description", language: "Swift", openIssues:    20),
                            Home.init(id: 0, name: "first", descriptionText: "description", language: "Swift", openIssues: 4),
                            Home.init(id: 0, name: "first", descriptionText: "description", language: "Swift", openIssues: 15),
                            Home.init(id: 0, name: "first", descriptionText: "description", language: "Swift", openIssues: 10)]
}
