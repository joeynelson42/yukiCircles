// The following code is taken from APSpringButton
//
//  APSpringButton.swift
//  Copyright © 2015 Appsidian. All rights reserved.
//

import UIKit

class APSpringButton: UIButton {

    internal var minimumScale: CGFloat = 0.95
    internal var pressSpringDamping: CGFloat = 0.4
    internal var releaseSpringDamping: CGFloat = 0.35
    internal var pressSpringDuration = 0.4
    internal var releaseSpringDuration = 0.5
    
    override internal func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: self.pressSpringDuration, delay: 0, usingSpringWithDamping: self.pressSpringDamping, initialSpringVelocity: 0, options: [.curveLinear, .allowUserInteraction], animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: self.minimumScale, y: self.minimumScale)
        }, completion: nil)
    }
    
    override internal func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: self.releaseSpringDuration, delay: 0, usingSpringWithDamping: self.releaseSpringDamping, initialSpringVelocity: 0, options: [.curveLinear, .allowUserInteraction], animations: { () -> Void in
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    override internal func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        if !self.bounds.contains(location) {
            UIView.animate(withDuration: self.releaseSpringDuration, delay: 0, usingSpringWithDamping: self.releaseSpringDamping, initialSpringVelocity: 0, options: [.curveLinear, .allowUserInteraction], animations: { () -> Void in
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    override internal func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: self.releaseSpringDuration, delay: 0, usingSpringWithDamping: self.releaseSpringDamping, initialSpringVelocity: 0, options: [.curveLinear, .allowUserInteraction], animations: { () -> Void in
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
