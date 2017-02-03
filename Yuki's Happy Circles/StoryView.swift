//
//  StoryView.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 2/3/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class StoryView: UIView, BigBanging {
    
    // MARK: Subviews
    let locationContainer = UIView()
    let locationLabel = UILabel()
    
    let videoContainer = UIView()
    let videoLabel = UILabel()
    
    let nextButton = APSpringButton()
    
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
        
        locationContainer.backgroundColor = .white
        locationContainer.layer.borderColor = UIColor.black.cgColor
        locationContainer.layer.borderWidth = 4
        
        locationLabel.text = "Hey."
        locationLabel.textColor = .black
        locationLabel.adjustsFontSizeToFitWidth = true
        locationLabel.font = UIFont(name: "Avenir-Medium", size: 35)
        
        videoContainer.backgroundColor = .white
        videoContainer.layer.borderColor = UIColor.black.cgColor
        videoContainer.layer.borderWidth = 4
        
        videoLabel.text = "When you get there, tap this:"
        videoLabel.numberOfLines = 0
        videoLabel.textColor = .black
        videoLabel.adjustsFontSizeToFitWidth = true
        videoLabel.font = UIFont(name: "Avenir-Medium", size: 15)
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 15)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.backgroundColor = .white
        nextButton.layer.borderColor = UIColor.black.cgColor
        nextButton.layer.borderWidth = 2.5
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        addAutoLayoutSubview(locationContainer)
        locationContainer.addAutoLayoutSubview(locationLabel)
        
        addAutoLayoutSubview(videoContainer)
        videoContainer.addAutoLayoutSubview(videoLabel)
        
        addAutoLayoutSubview(nextButton)
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            locationContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            locationContainer.widthAnchor.constraint(equalToConstant: 225),
            locationContainer.heightAnchor.constraint(equalToConstant: 225),
            locationContainer.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationContainer.centerYAnchor),
            locationLabel.leftAnchor.constraint(equalTo: locationContainer.leftAnchor, constant: 15),
            locationLabel.rightAnchor.constraint(equalTo: locationContainer.rightAnchor),
            
            videoContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            videoContainer.widthAnchor.constraint(equalToConstant: 150),
            videoContainer.heightAnchor.constraint(equalToConstant: 150),
            videoContainer.topAnchor.constraint(equalTo: locationContainer.bottomAnchor, constant: 70),
            
            videoLabel.topAnchor.constraint(equalTo: videoContainer.topAnchor),
            videoLabel.bottomAnchor.constraint(equalTo: videoContainer.bottomAnchor),
            videoLabel.leftAnchor.constraint(equalTo: videoContainer.leftAnchor, constant: 10),
            videoLabel.rightAnchor.constraint(equalTo: videoContainer.rightAnchor),
            
            nextButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -22),
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -22),
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
}
