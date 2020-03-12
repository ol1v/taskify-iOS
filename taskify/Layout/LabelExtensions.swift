//
//  LabelExtensions.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-03-11.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func loginAnimation() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 1.3, y: 1.2)
        }, completion: {
            b in
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
}
