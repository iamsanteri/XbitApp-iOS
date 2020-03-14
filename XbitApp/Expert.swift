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
    
    init(name: String, phoneNumber: String, email: String, photo: UIImage?) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.photo = photo
    }
}
