//
//  RequestTableViewCell.swift
//  XbitApp
//
//  Created by Santeri Liukkonen on 21.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit

class RequestTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet var requestTitle: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var requestPreview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
