//
//  HappyCircle.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 1/14/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

@IBDesignable class HappyCircle: UIButton {
    
    // MARK: Properties
    @IBInspectable var fillColor: UIColor = UIColor.black
    @IBInspectable var randomizeFillColor: Bool = false
    @IBInspectable var filled: Bool = false
    var circleSize: CGFloat = 28
    
    // Views
    let mainCircle = UIButton()
    let fillCircle = UIButton()
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    convenience init(filled: Bool = false, color: UIColor = UIColor.black, size:CGFloat = 28){
        self.init(frame: CGRect.zero)
        self.fillColor = color
        self.filled = filled
        self.circleSize = size
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: CGRect.zero)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        configureSubviews()
        applyConstraints()
    }
    
    private func configureSubviews(){
        addTarget(self, action: #selector(toggle), for: .touchUpInside)
        
        if randomizeFillColor {
            // use the yukiColors count - 1 for a random color excluding the yellow
            let randIndex = Int(arc4random_uniform(UInt32(UIColor.yukiColors.count - 1)))
            fillColor = UIColor.yukiColors[randIndex]
        }
        
        mainCircle.layer.borderWidth = 2.0
        mainCircle.layer.borderColor = UIColor.black.cgColor
        mainCircle.backgroundColor = .white
        mainCircle.layer.cornerRadius = circleSize / 2
        mainCircle.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        
        fillCircle.backgroundColor = fillColor
        fillCircle.layer.cornerRadius = circleSize / 2
        fillCircle.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        if filled {
            fillCircle.transform = CGAffineTransform.identity
        } else {
            fillCircle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        }
        
        mainCircle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainCircle)
        
        fillCircle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(fillCircle)
    }
    
    private func applyConstraints() {
        mainCircle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainCircle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainCircle.widthAnchor.constraint(equalToConstant: circleSize).isActive = true
        mainCircle.heightAnchor.constraint(equalToConstant: circleSize).isActive = true
        
        fillCircle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fillCircle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        fillCircle.widthAnchor.constraint(equalToConstant: circleSize + 1).isActive = true
        fillCircle.heightAnchor.constraint(equalToConstant: circleSize + 1).isActive = true
    }
    
    func toggle() {
        if filled {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                self.fillCircle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                self.fillCircle.transform = CGAffineTransform.identity
            }, completion: nil)
        }
        
        filled = !filled
    }
}

