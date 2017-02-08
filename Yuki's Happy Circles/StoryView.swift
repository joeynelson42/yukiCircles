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
    var collection: UICollectionView!
    var pageProgress: PagedProgressControl!
    
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
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.register(StoryCollectionCell.self, forCellWithReuseIdentifier: "storyCell")
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.delaysContentTouches = false
        
        for subview in collection.subviews {
            if subview.isKind(of: UIScrollView.self) {
                (subview as! UIScrollView).delaysContentTouches = false
            }
        }
        
        pageProgress = PagedProgressControl(count: 5, circleSize: 25, spacing: 10)
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        addAutoLayoutSubview(collection)
        addAutoLayoutSubview(pageProgress)
        
        collection.fillSuperview()
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            pageProgress.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            pageProgress.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
    }
}
