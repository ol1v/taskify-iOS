//
//  AlertHandler.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-03-09.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import UIKit

class AlertHandler {
    
    init() {
        
    }
    
    func alert(title: String, textfieldplaceholder: String, buttontitle: String) -> CustomAlertView {
        
        let storyboard = UIStoryboard(name: "CustomAlert", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "alertVC") as! CustomAlertView
        
        alertVC.alertTitle = title
        alertVC.alertTextFieldPlaceholder = textfieldplaceholder
        alertVC.alertButton = buttontitle
        
        return alertVC
    }
}
