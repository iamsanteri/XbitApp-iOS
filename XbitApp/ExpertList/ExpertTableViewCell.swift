//
//  ExpertTableViewCell.swift
//  XbitApp
//
//  Created by Erik Kellenter on 14.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit

class ExpertTableViewCell: UITableViewCell {

    //MARK:- Outlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
