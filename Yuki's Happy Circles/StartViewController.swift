//
//  StartViewController.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 2/3/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: View
    
    var startView = StartView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = startView
        setupViewOnLoad()
    }
    
    /// Setup View upon loading ViewController (e.g. add targets to buttons, update labels with data, etc.)
    func setupViewOnLoad() {
        startView.startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startView.bigBang()
    }
    
    func startAction() {
        let vc = StoryViewController()
        present(vc, animated: true, completion: nil)
    }
}
