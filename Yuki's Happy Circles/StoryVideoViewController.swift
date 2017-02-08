//
//  StoryVideoViewController.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 2/8/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class StoryVideoViewController: UIViewController {
    
    // MARK: - View
    
    let storyVideoView = StoryVideoView()
    
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = storyVideoView
        setupViewOnLoad()
    }
    
    /// Setup View upon loading ViewController (e.g. add targets to buttons, update labels with data, etc.)
    func setupViewOnLoad() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
