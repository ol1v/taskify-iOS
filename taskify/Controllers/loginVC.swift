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
        
        //animateAssetsWhenViewLoaded()
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
        self.performSegue(withIdentifier: "loginToUserMainSegue", sender: self)
    }
    // Gör extension
    func animateAssetsWhenViewLoaded(){
        UIView.animate(withDuration: 0.5, delay: 3, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseIn, animations: {
            //self.loginLabel.transform = CGAffineTransform(scaleX: 0, y: )
        }, completion: nil)
    }
    
}

