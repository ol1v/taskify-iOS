//
//  LayoutExtensions.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-03-02.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    // Creates line underneath textfield and removes outlines
    func styleTextField() {
           
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
           
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        
    }
}

