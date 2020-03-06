//
//  signupVC.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-25.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

// signup med email
// signup med facebook
// kolla så att username är unikt och har ett visst antal chars (password, email)
//

import UIKit

class signupVC: UIViewController {
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmEmailTextField: UITextField!
    var DBHelper = DatabaseHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set design for assets
        styleAssetsInView()
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        
       //Validate textfields
        let error = checkSignupConditions()
        
        if error != nil {
            print("error: \(error!)")
        } else {
                    // Create user
            let user: User = User(username: usernameTextField.text!,
                                  password: passwordTextField.text!,
                                  email: emailTextField.text!)
            
            print("user created: \(user.username!)")
            DBHelper.createUser(user: user)
            // Go to logged-in-screen
            // Add auto-login
        }
    }
    
    func checkSignupConditions() -> String? {
         //Validate textfields
               if(usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                   passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                   emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
                   ) {
                   return "Please make sure you've filled in all the fields correctly."
               }
        //check password for special characters
        let approvedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // check to see if password contains 8 characters with one uppercased and one numerical. Else return a hint.
        if isPasswordValidated(password: approvedPassword) == false {
            return "You need a minimum of 8 character, one uppercased and one numerical."
        }
        return nil
    }
    
    func isPasswordValidated(password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        
        return passwordTest.evaluate(with: password)
    }
    
    func styleAssetsInView() {
        //TextFields
        usernameTextField.styleTextField()
        passwordTextField.styleTextField()
        emailTextField.styleTextField()
        confirmEmailTextField.styleTextField()
        //Buttons
        createAccountButton.roundCornerRadiusButton()
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


