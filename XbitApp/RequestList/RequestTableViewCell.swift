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
    
    
    @IBOutlet weak var requestTitleLabel: UILabel!
    
    @IBOutlet weak var requestBodyLabel: UILabel!
    
    @IBOutlet weak var requestImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(request: Request) {
        requestImage.image = request.image
        requestTitleLabel.text = request.title
        requestBodyLabel.text = request.request
        self.selectionStyle = .none
    }

}
