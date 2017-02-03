//
//  BigBanging.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 2/3/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

protocol BigBanging {
    func bigBang()
}

extension BigBanging where Self:UIView {
    func bigBang() {
        
        for circle in self.subviews {
            if circle.tag == 121491 {
                circle.removeFromSuperview()
            }
        }
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        for _ in 1...35 {
            let x = CGFloat(arc4random_uniform(UInt32(width)))
            let y = CGFloat(arc4random_uniform(UInt32(height)))
            let size = CGFloat(arc4random_uniform(UInt32(100)))
            let colorIndex = Int(arc4random_uniform(UInt32(UIColor.yukiColors.count)))
            
            let circle = UIView(frame: CGRect(x: x, y: y, width: size, height: size))
            circle.layer.cornerRadius = size / 2
            circle.backgroundColor = UIColor.yukiColors[colorIndex]
            circle.layer.borderWidth = 2.0
            circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            circle.tag = 121491
            
            self.addSubview(circle)
            self.sendSubview(toBack: circle)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            for circle in self.subviews {
                circle.transform = CGAffineTransform.identity
            }
        }, completion: nil)
    }
}
