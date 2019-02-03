//
//  HomeTableViewCell.swift
//  VDB
//
//  Created by Puneet Gurtoo on 1/31/19.
//  Copyright © 2019 Puneet Gurtoo. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var label_title: UILabel!
    @IBOutlet var label_description: UILabel!
    @IBOutlet var label_language: UILabel!
    @IBOutlet var label_openIssues: UILabel!
    @IBOutlet var label_watchers: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func populateHome(_ home:Home) {
        label_title.text = home.name
        label_description.text = home.descriptionText
        label_language.text = home.language
        label_openIssues.text = "\(home.openIssues)"
        label_watchers.text = "\(home.watchers)"
    }
}
