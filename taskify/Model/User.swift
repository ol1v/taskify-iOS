//
//  User.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-28.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var userID: String?
    var username: String?
    var password: String?
    var email: String?
    var points: Int = 0
    var usersGroups: [Group] = []
    
    init(username: String, password: String, email: String) {
        self.username = username
        self.password = password
        self.email = email
    }
}
