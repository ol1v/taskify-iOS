//
//  ViewExtensions.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-03-06.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func setShadow() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        }
    
    func expandView() {
          
      }
    
    func shrinkView() {
        self.frame.size.height = 20
      }
    
    func roundCorners() {
        self.layer.cornerRadius = 50
    }
}
