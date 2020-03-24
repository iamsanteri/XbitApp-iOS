//
//  Expert.swift
//  XbitApp
//
//  Created by Erik Kellenter on 14.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import UIKit

class Expert {
    //MARK: Properties
    var name: String
    var phoneNumber: String
    var email: String
    var photo: UIImage?
    var skills: [Skill]?
    var role: String?
    
    init(name: String, phoneNumber: String, email: String, photo: UIImage?, skills: [Skill]?, role: String?) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.photo = photo
        self.skills = skills
        self.role = role
    }
}
