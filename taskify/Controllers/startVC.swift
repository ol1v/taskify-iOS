//
//  startVC.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-25.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import UIKit

class startVC: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set style of assets in view
        setTransparentNavigationbar()
        styleViewAssets()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "startToLoginSegue", sender: self)
    }
    @IBAction func signupButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "startToSignupSegue", sender: self)
    }
    func styleViewAssets() {
        signupButton.roundCornerRadiusButton()
        loginButton.roundCornerRadiusButton()
    }
    // Make extension
    func setTransparentNavigationbar() {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
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
