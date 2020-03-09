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
    let alertHandler = AlertHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTransparentNavigationbar()
        setStylesInView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "groupCell",bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "groupCell")
        
        // load user - signup funkar. Fixa via LoginVC
        //userSettingsItem.title = user.username
    }
    
    func setStylesInView() {
        newGroupButton.roundButton()
        bottomView.roundCorners()
    }

    func loadUser() {
        // get the logged in user
        // get the logged in users data from database
    }
    func createNewGroup(){
        // Group(groupname, creator)
        }
    
    @IBAction func newGroupButtonPressed(_ sender: Any) {
        // Alertview with namefield, and a way to invite members directly.
        let alertVC = alertHandler.alert(title: "Create New Group", textfieldplaceholder: "Groupname...", buttontitle: "Create")
        
        present(alertVC, animated: true)
        
    }
    
    // skapa global function för detta
    func setTransparentNavigationbar() {
          self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
          self.navigationController!.navigationBar.shadowImage = UIImage()
          self.navigationController!.navigationBar.isTranslucent = true
      }
}


// #MARK: - extensions
extension userVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Add custom cell "groupCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! groupCell
        
        cell.textLabel!.text = "it works"
        
        return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToGroupSegue", sender: self)
    }
}
