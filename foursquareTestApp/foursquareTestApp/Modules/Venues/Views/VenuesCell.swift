//
//  VenuesCell.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import UIKit

class VenueCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var adressLabel: UILabel!
    
    func setup(with model: VenueModel?) {
        nameLabel.text = model?.name
        adressLabel.text = model?.formattedAddress
    }

}
