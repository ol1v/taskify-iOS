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
    func loginAnimation(duration: Double, delay: Double) {
           UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 1.0,
                          initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                           self.transform = CGAffineTransform(scaleX: 1.3, y: 1.0)
           }, completion: {
               b in
               self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
           })
       }
}
