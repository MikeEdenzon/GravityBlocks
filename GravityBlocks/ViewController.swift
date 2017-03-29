//
//  ViewController.swift
//  GravityBlocks
//
//  Created by Michael Edenzon on 4/19/16.
//  Copyright © 2016 Michael Edenzon. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var items: [UIView]!
    var animator: UIDynamicAnimator!
    var motionManager: CMMotionManager!
    var collision: UICollisionBehavior!
    var gravity: UIGravityBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        update()
    }
    
    func createItems(view: UIView) ->[UIView] {
        
        let center = view.center
        let w = view.frame.width
        
        let ellipse1 = Ellipse(frame: CGRect(x: center.x, y: center.y, width: w/8, height: w/8), color: Color.red)
        let ellipse2 = Ellipse(frame: CGRect(x: center.x + w/5, y: center.y - w/5, width: w/5, height: w/5), color: Color.yellow)
        let rectangle1 = Rectangle(frame: CGRect(x: center.x + 50, y: center.x + 60, width: w/6, height: w/6), color: Color.blue)
        let rectangle2 = Rectangle(frame: CGRect(x: center.x - 90, y: center.x - 90, width: w/8, height: w/6), color: Color.green)
        
        return [ellipse1, ellipse2, rectangle1, rectangle2]
    }
    
    func setup() {
        
        items = createItems(view: view)
        
        for item in items {
            view.addSubview(item)
        }
        
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.01
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        collision = UICollisionBehavior(items: items)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        gravity = UIGravityBehavior(items: items)
    }
    
    func update() {
        
        self.motionManager.startAccelerometerUpdates(to: OperationQueue()) {
            
            (data, error) in
            
            DispatchQueue.main.async {
                
                let accelerometerData = self.motionManager.accelerometerData
                let dx = accelerometerData!.acceleration.x
                let dy = accelerometerData!.acceleration.y
                
                self.animator.removeBehavior(self.gravity)
                self.gravity.gravityDirection = CGVector(dx: dx, dy: dy * -1)
                
                for item in self.items {
                    self.animator.updateItem(usingCurrentState: item)
                }
                
                self.animator.addBehavior(self.gravity)
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
}




