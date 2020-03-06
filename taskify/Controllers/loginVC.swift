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
        self.performSegue(withIdentifier: "loginToUserMainSegue", sender: self)
    }
    // Gör extension
    func animateAssetsWhenViewLoaded(){
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseIn, animations: {
            self.loginLabel.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: nil)
        //Do other animations of assets in loginview
    }
    
}

