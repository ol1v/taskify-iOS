//
//  Task.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-28.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import Foundation

class Task: NSObject {
    
    var basicTask: String!
    var groceryListTask: [Dictionary<String, Bool>] = []
    let newGrocerytaskStatus: Bool = false
    
    init(basictask: String) {
        self.basicTask = basictask
    }
    init(groceryList: [String]) {
        for task in groceryList {
            let grocerytask: [String: Bool] = [task:newGrocerytaskStatus]
            self.groceryListTask.append(grocerytask)
        }
        
    }
}
