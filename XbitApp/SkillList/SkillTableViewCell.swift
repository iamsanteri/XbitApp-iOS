//
//  SkillTableViewCell.swift
//  XbitApp
//
//  Created by Erik Kellenter on 21.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit

class SkillTableViewCell: UITableViewCell {

    @IBOutlet weak var skillImageView: UIImageView!
    
    @IBOutlet weak var skillLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(skill: Skill) {
        skillImageView.image = skill.image
        skillLabel.text = skill.skillName
        self.selectionStyle = .none
    }
}
