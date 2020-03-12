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
    var pendingMember: User!
    
    init(groupName: String, groupCreator: User){
        self.groupName = groupName
        self.groupMembers.append(groupCreator)
    }
    override init() {
        
    }
    func createBasicTask(task: String) -> Task {
        let task = Task(basictask: task)
        groupTasks.append(task)
        return task
    }
    func inviteMember(){
        // self.pendingMember = user of choice
        // send request to member -> Bool
        // listen for return true, if true add member to group
    }
    func addMember(){
        
    }
    func addTask() {
    
    }
}
