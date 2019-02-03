//
//  APIManager.swift
//  VDB
//
//  Created by Puneet Gurtoo on 2/2/19.
//  Copyright © 2019 Puneet Gurtoo. All rights reserved.
//

import Foundation
import Alamofire

// We will maintain Alamofire API calling in this class. For now, I am calling it in HomeViewModel only.
class APIManager {
    
    enum ReachabilityStatus {
        case reachable
        case notReachable
    }

    func getReachabilityStatus() -> ReachabilityStatus {
        let reachabilityManager = NetworkReachabilityManager()
        if (reachabilityManager?.isReachable)! {
            return .reachable
        }
        else{
            return .notReachable
        }
    }
}
