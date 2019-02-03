//
//  HomeViewController.swift
//  VDB
//
//  Created by Puneet Gurtoo on 1/31/19.
//  Copyright © 2019 Puneet Gurtoo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //Outlets
    @IBOutlet var tableView_home: UITableView!
    
    //Private
    private var homeViewModel:HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        initializeViewModel()
        getHomeDataForPage(0)
    }
    private func setUpTable() {
        tableView_home.delegate = self
        tableView_home.dataSource = self
    }
    private func initializeViewModel() {
        homeViewModel = HomeViewModel()
    }
    
    private func getHomeDataForPage(_ page:Int) {
        let url = Urls.base + "page=\(page + 1)&per_page=\(homeViewModel.perPageDataCount)"
        homeViewModel.getDataForUrl(url) { (response:[Home]?) in
            if let response = response {
                if response.count > 0 {
                    DispatchQueue.main.async {
                        self.tableView_home.reloadData()
                    }
                }
            }
            else {
                print("Error")
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let homeArray = homeViewModel.homeArray {
            return homeArray.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeConstants.kRowIdentifier, for: indexPath) as! HomeTableViewCell
        let home = homeViewModel.homeArray![indexPath.row]
        cell.populateHome(home)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeConstants.kRowHeight
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if homeViewModel.isCompleteDataFetched {
            tableView.tableFooterView?.isHidden = true
            return
        }
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section)-3 {
            self.getHomeDataForPage(homeViewModel.currentPage)
            let spinner = UIActivityIndicatorView(style: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            tableView.tableFooterView = spinner
            tableView.tableFooterView?.isHidden = false
        }
    }
}

extension HomeViewController {
    struct HomeConstants
    {
        static let kRowIdentifier = "HomeTableViewCell"
        static let kRowHeight:CGFloat = 110.0
    }
}
