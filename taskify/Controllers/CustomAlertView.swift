//
//  CustomAlertView.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-03-08.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import UIKit

class CustomAlertView: UIViewController {
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var alertTextField: UITextField!
    @IBOutlet weak var alertOkButton: UIButton!
    @IBOutlet weak var alertCancelButton: UIButton!
    @IBOutlet weak var alertView: UIView!
    
    var alertTitle = String()
    var alertTextFieldPlaceholder = String()
    var alertButton = String()
    var alertTextFieldText = String()
    var onOkPressed: (String) -> Void = {name in print("no onclick added")}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleAssetsInView()
        setTextsInView()
    }
    func setTextsInView() {
        alertLabel.text = alertTitle
        alertTextField.placeholder = alertTextFieldPlaceholder
        alertOkButton.setTitle(alertButton, for: .normal)
    }
    
    func styleAssetsInView() {
        alertView.roundCornerRadius()
        alertOkButton.roundCornerRadiusButton()
        alertCancelButton.roundCornerRadiusButton()
    }
    
    @IBAction func alertOkButtonPressed(_ sender: Any) {
        // Group should be added to users groupsarray
        
        alertTextFieldText = alertTextField.text!
        onOkPressed(alertTextFieldText)
        dismiss(animated: true)
        
    }
    @IBAction func alertCancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
