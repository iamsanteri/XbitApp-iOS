//
//  Request.swift
//  XbitApp
//
//  Created by Santeri Liukkonen on 21.03.20.
//  Copyright © 2020 xbit-ios. All rights reserved.
//

import Foundation

struct Request {
    var title: String
    var request: String
    
    init(title: String, request: String) {
        self.title = title
        self.request = request
    }
}
