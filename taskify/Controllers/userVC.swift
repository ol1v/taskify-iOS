//
//  userVC.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-25.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import UIKit

class userVC: UIViewController {

    @IBOutlet weak var userSettingsItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newGroupButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    var user: User!
    var selectedGroup: Group!
    var newGroup = String()
    let alertHandler = AlertHandler()
    let dbHelper = DatabaseHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set userVC as rootviewcontroller (when logged in)
        // get user from database
        
        // Set layout in viewcontroller
        //setTransparentNavigationbar()
        setStylesInView()
        // tableView
        tableView.dataSource = self
        tableView.delegate = self
        // tableview customcell
        let nib = UINib(nibName: "groupCell",bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "groupCell")
        
        // load user - signup funkar. Fixa via LoginVC
        userSettingsItem.title = user.username
        fetchGroupsFromDB()
        
    }
    
    func setStylesInView() {
        newGroupButton.roundButton()
        bottomView.roundCorners()
    }
    
    func fetchGroupsFromDB() {
        dbHelper.updateData(user: self.user)
    }

    @IBAction func newGroupButtonPressed(_ sender: Any) {
        // Custom Alertview with textfield.
        let alertVC = alertHandler.alert(title: "Create New Group", textfieldplaceholder: "Groupname...", buttontitle: "Create", onOkPressed: {
            name in
            // Lägga till grupp i databas!
            self.user.createGroup(groupname: name, user: self.user)
            // Add group to database
            //self.dbHelper.addGroupToDatabase(group: newGroup)
            //reload data in tableview after new group is created.
            self.tableView.reloadData()
        })
        
        present(alertVC, animated: true)
        
    }
    // Gör extension av detta
    /*func setTransparentNavigationbar() {
          self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
          self.navigationController!.navigationBar.shadowImage = UIImage()
          self.navigationController!.navigationBar.isTranslucent = true
      }*/
}


// #MARK: - extensions
extension userVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.usersGroups.count > 0 ? user.usersGroups.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Add custom cell "groupCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! groupCell
        
        if(user.usersGroups.count < 1){
            cell.textLabel!.text = " "
        } else{
            cell.textLabel!.text = user.usersGroups[indexPath.row].groupName
            }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedGroup = self.user.usersGroups[indexPath.row]
        self.performSegue(withIdentifier: "goToGroupSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToGroupSegue") {
            let vc = segue.destination as? groupVC
            vc?.group = self.selectedGroup
        }
    }
    
    
}
