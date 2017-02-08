//
//  StoryVideoView.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 2/8/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class StoryVideoView: UIView {
    
    // MARK: - Subviews
    
    
    // MARK: - Stored Constraints
    // (Store any constraints that might need to be changed or animated later)
    
    
    // MARK: - Initialization
    
    convenience init() {
        self.init(frame: .zero)
        configureSubviews()
        configureLayout()
    }
    
    /// Set view/subviews appearances
    fileprivate func configureSubviews() {
        
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            
            ])
    }
}
