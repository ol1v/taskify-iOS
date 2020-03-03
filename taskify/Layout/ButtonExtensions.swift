//
//  roundButton.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-29.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import Foundation
import UIKit


extension UIButton {
    func roundButton() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2
    }
    func roundCornerRadiusButton() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
    }
}
