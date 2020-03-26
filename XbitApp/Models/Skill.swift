//
//  Skill.swift
//  XbitApp
//
//  Created by Erik Kellenter on 14.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import Foundation
import UIKit

class Skill {
    var skillName: String
    var level: Int?
    var image: UIImage?
    
    init(skill: String, level: Int?, image: UIImage?) {
        self.skillName = skill
        self.level = level
        self.image = image
    }
    
    init(skill: String, image: UIImage?) {
        self.skillName = skill
        self.image = image
    }
    
    init(skill: String, level: Int) {
        self.skillName = skill
        self.level = level
    }
}
