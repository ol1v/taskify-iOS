//
//  signupVC.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-25.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import UIKit

class signupVC: UIViewController {
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleAssetsInView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
    }
    
    func styleAssetsInView() {
        createAccountButton.roundCornerRadiusButton()
        usernameTextField.styleTextField()
        passwordTextField.styleTextField()
        emailTextField.styleTextField()
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


