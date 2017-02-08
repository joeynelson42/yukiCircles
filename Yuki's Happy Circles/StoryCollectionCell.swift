//
//  StoryCollectionCell.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 2/3/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class StoryCollectionCell: UICollectionViewCell {
    
    // MARK: - Subviews
    let locationContainer = UIView()
    let locationLabel = UILabel()
    let videoContainer = UIView()
    let videoLabel = UILabel()
    let videoButton = APSpringButton()
    
    var locationText = NSMutableAttributedString() {
        didSet {
            locationLabel.attributedText = locationText
            locationContainerHeight.constant = locationLabel.intrinsicContentSize.height + 30
        }
    }
    
    // MARK: - Stored Constraints
    // (Store any constraints that might need to be changed or animated later)
    var locationContainerHeight: NSLayoutConstraint!
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set view/subviews appearances
    fileprivate func configureSubviews() {
        backgroundColor = .clear
        
        locationContainer.backgroundColor = .white
        locationContainer.layer.borderColor = UIColor.black.cgColor
        locationContainer.layer.borderWidth = 4
        
        locationLabel.lineBreakMode = .byWordWrapping
        locationLabel.numberOfLines = 0
        locationLabel.textColor = .black
        locationLabel.font = UIFont(name: "Avenir-Medium", size: 20)
        
        videoContainer.backgroundColor = .white
        videoContainer.layer.borderColor = UIColor.black.cgColor
        videoContainer.layer.borderWidth = 4
        
        videoLabel.text = "When you get there, tap this:"
        videoLabel.lineBreakMode = .byWordWrapping
        videoLabel.numberOfLines = 0
        videoLabel.textColor = .black
        videoLabel.font = UIFont(name: "Avenir-Medium", size: 15)
        
        videoButton.layer.cornerRadius = 30
        videoButton.layer.borderWidth = 2
        videoButton.layer.borderColor = UIColor.black.cgColor
        videoButton.backgroundColor = UIColor.randomYukiColor()
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        addAutoLayoutSubview(locationContainer)
        locationContainer.addAutoLayoutSubview(locationLabel)
        
        addAutoLayoutSubview(videoContainer)
        videoContainer.addAutoLayoutSubview(videoLabel)
        videoContainer.addAutoLayoutSubview(videoButton)
        
        locationContainerHeight = locationContainer.heightAnchor.constraint(equalToConstant: 225)
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            locationContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            locationContainer.widthAnchor.constraint(equalToConstant: 225),
            locationContainerHeight,
            locationContainer.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            
            locationLabel.topAnchor.constraint(equalTo: locationContainer.topAnchor, constant: 15),
            locationLabel.leftAnchor.constraint(equalTo: locationContainer.leftAnchor, constant: 15),
            locationLabel.rightAnchor.constraint(equalTo: locationContainer.rightAnchor, constant: -15),
            
            videoContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            videoContainer.widthAnchor.constraint(equalToConstant: 150),
            videoContainer.heightAnchor.constraint(equalToConstant: 150),
            videoContainer.topAnchor.constraint(equalTo: locationContainer.bottomAnchor, constant: 70),
            
            videoLabel.topAnchor.constraint(equalTo: videoContainer.topAnchor, constant: 15),
            videoLabel.leftAnchor.constraint(equalTo: videoContainer.leftAnchor, constant: 15),
            videoLabel.rightAnchor.constraint(equalTo: videoContainer.rightAnchor, constant: -15),
            
            videoButton.centerXAnchor.constraint(equalTo: videoContainer.centerXAnchor),
            videoButton.topAnchor.constraint(equalTo: videoLabel.bottomAnchor, constant: 10),
            videoButton.widthAnchor.constraint(equalToConstant: 60),
            videoButton.heightAnchor.constraint(equalToConstant: 60)
            ])
    }
}

