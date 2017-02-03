//
//  StoryViewController.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 2/3/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    // MARK: View
    
    var storyView = StoryView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = storyView
        setupViewOnLoad()
    }
    
    /// Setup View upon loading ViewController (e.g. add targets to buttons, update labels with data, etc.)
    func setupViewOnLoad() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        storyView.bigBang()
    }
}
