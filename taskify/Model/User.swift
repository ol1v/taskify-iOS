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
    let dbHelper = DatabaseHelper()
    
    init(username: String, password: String, email: String) {
        self.username = username
        self.password = password
        self.email = email
    }
    init(username: String) {
        self.username = username
    }
    init(username: String, uid: String){
        self.username = username
        self.userID = uid
    }
    init(uid: String, username: String, groups: [Group]){
        self.userID = uid
        self.username = username
        self.usersGroups = groups
    }
    
    func createGroup(groupname: String, user: User) {
        
        let group: Group = Group(groupName: groupname, groupCreator: user)
        self.usersGroups.append(group)
        print("group created: \(group.groupName)")
        print("by user: \(user.username!)")
        
        // add group to database
        dbHelper.addGroupToDatabase(group: group,user: user)
    }

}
