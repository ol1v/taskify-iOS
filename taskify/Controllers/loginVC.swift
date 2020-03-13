//
//  loginVC.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-25.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clickhereButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotpasswordLabel: UILabel!
    var user: User!
    let dbHelper = DatabaseHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTransparentNavigationbar()
        styleAssetsInView()
    }
    override func viewDidAppear(_ animated: Bool) {
        animateAssetsWhenViewLoaded()
    }
    
    func setTransparentNavigationbar() {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    
    func styleAssetsInView() {
        loginButton.roundCornerRadiusButton()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        // Check username and password
        let email = usernameTextField.text!
        let password = passwordTextField.text!
        var userid = String()
        
        dbHelper.loginUser(email: email, password: password) { (uid) in
            userid = uid
        }
        dbHelper.getUser(uid: userid) { (user) in
            self.user = user
        }
        
        self.performSegue(withIdentifier: "loginToUserMainSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if(segue.identifier == "loginToUserMainSegue") {
               let vc = segue.destination as? userVC
                vc?.user = self.user
                       
               /*view.window?.rootViewController = vc
               view.window?.makeKeyAndVisible()*/
           }
       }
    
    func animateAssetsWhenViewLoaded(){
        // Animate assets
        self.loginLabel.loginAnimation()
        self.usernameTextField.loginAnimation(duration: 0.3, delay: 0.3)
        self.passwordTextField.loginAnimation(duration: 0.3, delay: 0.4)
        self.clickhereButton.loginAnimation(duration: 0.3, delay: 0.9)
        self.loginButton.loginAnimation(duration: 0.3, delay: 1.3)
        
    }
    
    
}

