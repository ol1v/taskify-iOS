//
//  Group.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-28.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import Foundation

class Group: NSObject {
    var groupId: String!
    var groupName = String()
    var groupMembers: [User] = []
    var groupTasks: [Task] = []
    
    init(groupName: String, groupCreator: User){
        self.groupName = groupName
        self.groupMembers.append(groupCreator)
    }
    override init() {
        
    }
    func addTask() {
    
    }
}
