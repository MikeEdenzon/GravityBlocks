//
//  Rectangle.swift
//  GravityBlocks
//
//  Created by Michael Edenzon on 4/19/16.
//  Copyright © 2016 Michael Edenzon. All rights reserved.
//

import Foundation
import UIKit

class Rectangle: UIView {

    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        get {
            return .rectangle
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, color: UIColor) {
        self.init(frame: frame)
        self.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
