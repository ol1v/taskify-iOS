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
        self.performSegue(withIdentifier: "loginToUserMainSegue", sender: self)
    }
    // Gör extension
    func animateAssetsWhenViewLoaded(){
        // Animate LoginLabel
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseIn, animations: {
            self.loginLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.2)
        }, completion: {
            b in
            self.loginLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        // Animate UsernameTextfield
        self.usernameTextField.loginAnimation(duration: 0.3, delay: 0.3)
        self.passwordTextField.loginAnimation(duration: 0.3, delay: 0.6)
        self.clickhereButton.loginAnimation(duration: 0.3, delay: 0.9)
        self.loginButton.loginAnimation(duration: 0.3, delay: 1.2)
        
        
        //Do other animations of assets in loginview
    }
    
}

