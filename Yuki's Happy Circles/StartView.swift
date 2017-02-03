//
//  StartView.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 2/3/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class StartView: UIView, BigBanging {
    
    // MARK: Subviews
    let infoContainer = UIView()
    let infoLabel = UILabel()
    
    let ruleContainer = UIView()
    let ruleLabel = UILabel()
    
    let startButton = APSpringButton()
    
    // MARK: Stored Constraints
    // (Store any constraints that might need to be changed or animated later)
    
    
    // MARK: - Initialization
    
    convenience init() {
        self.init(frame: .zero)
        configureSubviews()
        configureLayout()
    }
    
    /// Set view/subviews appearances
    fileprivate func configureSubviews() {
        backgroundColor = .white
        
        infoContainer.backgroundColor = .white
        infoContainer.layer.borderColor = UIColor.black.cgColor
        infoContainer.layer.borderWidth = 4
                
        infoLabel.text = "Hey."
        infoLabel.textColor = .black
        infoLabel.adjustsFontSizeToFitWidth = true
        infoLabel.font = UIFont(name: "Avenir-Medium", size: 35)
        
        ruleContainer.backgroundColor = .white
        ruleContainer.layer.borderColor = UIColor.black.cgColor
        ruleContainer.layer.borderWidth = 4
        
        ruleLabel.text = "Rule #1:\nDon't\nskip\nahead"
        ruleLabel.numberOfLines = 0
        ruleLabel.textColor = .black
        ruleLabel.adjustsFontSizeToFitWidth = true
        ruleLabel.font = UIFont(name: "Avenir-Medium", size: 25)
        
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 15)
        startButton.setTitleColor(.black, for: .normal)
        startButton.backgroundColor = .white
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.borderWidth = 2.5
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        addAutoLayoutSubview(infoContainer)
        infoContainer.addAutoLayoutSubview(infoLabel)
        
        addAutoLayoutSubview(ruleContainer)
        ruleContainer.addAutoLayoutSubview(ruleLabel)
        
        addAutoLayoutSubview(startButton)
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            infoContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoContainer.widthAnchor.constraint(equalToConstant: 150),
            infoContainer.heightAnchor.constraint(equalToConstant: 150),
            infoContainer.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            
            infoLabel.centerYAnchor.constraint(equalTo: infoContainer.centerYAnchor),
            infoLabel.leftAnchor.constraint(equalTo: infoContainer.leftAnchor, constant: 15),
            infoLabel.rightAnchor.constraint(equalTo: infoContainer.rightAnchor),
            
            ruleContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            ruleContainer.widthAnchor.constraint(equalToConstant: 150),
            ruleContainer.heightAnchor.constraint(equalToConstant: 150),
            ruleContainer.topAnchor.constraint(equalTo: infoContainer.bottomAnchor, constant: 70),
            
            ruleLabel.topAnchor.constraint(equalTo: ruleContainer.topAnchor),
            ruleLabel.bottomAnchor.constraint(equalTo: ruleContainer.bottomAnchor),
            ruleLabel.leftAnchor.constraint(equalTo: ruleContainer.leftAnchor, constant: 10),
            ruleLabel.rightAnchor.constraint(equalTo: ruleContainer.rightAnchor),
            
            startButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -22),
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -22),
            startButton.widthAnchor.constraint(equalToConstant: 80),
            startButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

class APSpringButton: UIButton {
    // The following code is taken from APSpringButton
    //
    //  APSpringButton.swift
    //  Copyright © 2015 Appsidian. All rights reserved.
    //
    
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
