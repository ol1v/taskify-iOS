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
    let dbHelper = DatabaseHelper()
    
    init(groupName: String, groupCreator: User){
        self.groupName = groupName
        self.groupMembers.append(groupCreator)
    }
    override init() {
        
    }
    func createBasicTask(basictask: String,group: Group){
        let task = Task(basictask: basictask)
        groupTasks.append(task)
        dbHelper.addTaskToDatabase(group: group, task: task)
        // Skicka in group 
        
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
