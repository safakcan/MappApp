//
//  DetailTableViewCell.swift
//  MapApp
//
//  Created by Safak Can Bas on 3.07.2020.
//  Copyright © 2020 canbas. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var viLabel: UILabel!
    
    
    func configureCellUI()  {
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.viLabel.font = UIFont.systemFont(ofSize: 16.0)
        self.viLabel.textColor = UIColor.lightGray
    }
}
