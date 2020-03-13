//
//  groupVC.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-28.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import UIKit

class groupVC: UIViewController {
    
    @IBOutlet weak var newTaskButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerTitleNavItem: UINavigationItem!
    @IBOutlet weak var addUserToGroupButton: UIButton!
    var group = Group()
    var alertHandler = AlertHandler()
    let dbHelper = DatabaseHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Ladda in gruppens tasks från databas
        
        tableView.delegate = self
        tableView.dataSource = self
        //headerTitleNavItem.title = group.groupName
        print("Entered group: \(group.groupName)")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addUserToGroupButtonClicked(_ sender: Any) {
        // Display tableview with searchbar
           // when clicked on cell, group.inviteMember
            // if returns true. group.addMember
    }
    
    @IBAction func newTaskButtonPressed(_ sender: Any) {
        let alertVC = alertHandler.alert(title: "Create New Task", textfieldplaceholder: "Task description...", buttontitle: "Create", onOkPressed: {
            name in
            // Lägga till task i groups taskArray!
            self.group.createBasicTask(basictask:name,group:self.group)
            // Add task to database
            
            //reload data in tableview after new task is created.
            self.tableView.reloadData()
        })
        
        present(alertVC, animated: true)
    }
}

extension groupVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.group.groupTasks.count > 0 ? self.group.groupTasks.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if(self.group.groupTasks.count < 1){
            cell.textLabel!.text = " "
        } else{
            cell.textLabel?.text = self.group.groupTasks[indexPath.row].basicTask
            }
        
        return cell
    }
    
    
}
