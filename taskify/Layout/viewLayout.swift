//
//  viewLayout.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-27.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import Foundation
import UIKit

class viewLayout: UIView {
    override func didMoveToWindow() {
        self.layer.cornerRadius = 50
    }
    func expandView() {
        
    }
    func shrinkView() {
        self.frame.size.height = 0
    }
}
