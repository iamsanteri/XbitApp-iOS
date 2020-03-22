//
//  Request.swift
//  XbitApp
//
//  Created by Santeri Liukkonen on 21.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import Foundation
import UIKit

struct Request {
    var title: String
    var request: String
    var image: UIImage?
    
    init(title: String, request: String, image: UIImage) {
        self.title = title
        self.request = request
        self.image = image
    }
}
