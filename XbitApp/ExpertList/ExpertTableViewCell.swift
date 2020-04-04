//
//  ExpertTableViewCell.swift
//  XbitApp
//
//  Created by Erik Kellenter on 14.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit
import FirebaseStorage

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
    
    func setup(with expert: Expert) {
        // Making images round
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.cornerRadius = photoImageView.bounds.width / 2
        
        nameLabel.text = expert.name
        phoneNumberLabel.text = expert.phoneNumber
        emailLabel.text = expert.email
        photoImageView.load(thumbnailPath: expert.thumbnailPath)
        self.selectionStyle = .none
    }
    
}

extension UIImageView {
    func load(thumbnailPath: String) {
        Storage.storage().reference().child(thumbnailPath).getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error loading images \(error)")
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                self.image = image
            }
        }
    }
}
