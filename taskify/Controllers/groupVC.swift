//
//  groupVC.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-28.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import UIKit

class groupVC: UIViewController {
    
    @IBOutlet weak var headerTitleNavItem: UINavigationItem!
    @IBOutlet weak var addUserToGroupButton: UIButton!
    var group = Group()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //headerTitleNavItem.title = group.groupName
        print("Entered group: \(group.groupName)")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addUserToGroupButtonClicked(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
