//
//  PagedProgressControl.swift
//  PowerPlay
//
//  Created by Joey on 2/7/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class PagedProgressControl: UIView {
    
    // MARK: Properties
    
    private var circleSize:CGFloat = 10
    private var circleCount = 5
    private var spacing:CGFloat = 15
    private var initialProgress = 1
    
    /// Computed value of the stackViews' width using the size, count, and spacing
    private var stackWidth: CGFloat {
        return (CGFloat(circleCount) * circleSize) + ((CGFloat(circleCount) - 1) * spacing)
    }
    
    /// Computed value of the initial progress width
    private var initialWidth: CGFloat {
        return (CGFloat(circleCount - initialProgress) / CGFloat(circleCount)) * stackWidth
    }
    
    // MARK: Subviews
    private let emptyStack = UIStackView()
    private let fillStack = UIStackView()
    private let emptyContainer = UIView()
    
    // MARK: Stored Constraints
    // (Store any constraints that might need to be changed or animated later)
    
    /// The progress animation hinges on this constraint, as the container width shrinks the emptyStack is hidden
    /// and the fillStack is revealed, and vice versa.
    private var containerWidth: NSLayoutConstraint!
    
    // MARK: - Initialization
    
    convenience init(count: Int, circleSize: CGFloat = 15, spacing: CGFloat = 10, initialProgress: Int = 1) {
        self.init(frame: .zero)
        self.circleCount = count
        self.circleSize = circleSize
        self.spacing = spacing
        self.initialProgress = initialProgress
        
        configureSubviews()
        configureLayout()
    }
    
    /// Set view/subviews appearances
    fileprivate func configureSubviews() {
        
        for (i,stack) in [emptyStack, fillStack].enumerated() {
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fillEqually
            stack.spacing = spacing
            stack.clipsToBounds = true
            
            for _ in 1...circleCount {
                let circle = UIView()
                circle.layer.cornerRadius = circleSize / 2
                
                if i == 0 {
                    circle.backgroundColor = .lightGray
                } else {
                    circle.backgroundColor = UIColor.randomYukiColor()
                }
                
                circle.layer.borderColor = UIColor.black.cgColor
                circle.layer.borderWidth = 2
                
                circle.widthAnchor.constraint(equalToConstant: circleSize).isActive = true
                circle.heightAnchor.constraint(equalToConstant: circleSize).isActive = true
                
                stack.addArrangedSubview(circle)
            }
        }
        
        containerWidth = emptyContainer.widthAnchor.constraint(equalToConstant: initialWidth)
        emptyContainer.backgroundColor = .clear
        emptyContainer.clipsToBounds = true
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        addAutoLayoutSubview(fillStack)
        addAutoLayoutSubview(emptyContainer)
        emptyContainer.addAutoLayoutSubview(emptyStack)
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            
            fillStack.widthAnchor.constraint(equalToConstant: stackWidth),
            fillStack.heightAnchor.constraint(equalToConstant: circleSize),
            fillStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            fillStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            containerWidth,
            emptyContainer.heightAnchor.constraint(equalToConstant: circleSize),
            emptyContainer.rightAnchor.constraint(equalTo: fillStack.rightAnchor),
            emptyContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            emptyStack.widthAnchor.constraint(equalToConstant: stackWidth),
            emptyStack.heightAnchor.constraint(equalToConstant: circleSize),
            emptyStack.rightAnchor.constraint(equalTo: emptyContainer.rightAnchor),
            emptyStack.centerYAnchor.constraint(equalTo: emptyContainer.centerYAnchor),
            ])
    }
    
    //MARK: Methods
    
    /// Updates the progress
    /// - progress: should be between 0 and 1
    public func update(progress: CGFloat) {
        containerWidth.constant = stackWidth * (1 - progress)
    }
}
