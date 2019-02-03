//
//  HomeViewModel.swift
//  VDB
//
//  Created by Puneet Gurtoo on 1/31/19.
//  Copyright © 2019 Puneet Gurtoo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class HomeViewModel
{
    let perPageDataCount = 15
    var currentPage = 0
    var isCompleteDataFetched = false
    var homeArray:[Home]?

    private func populateHomeModelWithModel(_ home:[Home]?) {
        if let homeArray = homeArray {
            if let home = home {
                self.homeArray = homeArray + home
            }
        }
        else {
            homeArray = home
        }
    }
    private func updateRealm(_ data:[Home]?) {
        if let data = data {
            DBManager.sharedInstance.addData(objects: data)
        }
    }
    func updateCurrentPage() {
        currentPage = currentPage + 1
    }
    func getDataForUrl(_ url:String,result:@escaping ([Home]?)->Void) {
        if APIManager().getReachabilityStatus() == .notReachable {
            let data = DBManager.sharedInstance.getDataFromDB()
            populateHomeModelWithModel(Array(data))
            result(Array(data))
            return
        }
        Alamofire.request(url, method: .get, parameters: nil, headers: nil).validate(statusCode: 200..<300).responseArray { (response:DataResponse<[Home]>) in
            switch response.result {
            case .success :
                if response.result.value?.count == 0 {
                    self.isCompleteDataFetched = true
                    return
                }
                self.updateCurrentPage()
                self.populateHomeModelWithModel(response.result.value)
                self.updateRealm(response.result.value)
                result(response.result.value)
            case .failure :
                result(nil)
            }
        }
    }
}
