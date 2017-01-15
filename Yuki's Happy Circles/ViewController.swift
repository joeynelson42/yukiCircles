//
//  ViewController.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 1/14/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bubbleContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigBang💥()
        NotificationCenter.default.addObserver(self, selector: #selector(bigBang💥), name: Notification.Name(rawValue: "reset"), object: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func bigBang💥() {
        for circle in bubbleContainer.subviews {
            circle.removeFromSuperview()
        }
        
        for _ in 1...20 {
            let x = CGFloat(arc4random_uniform(UInt32(screenWidth)))
            let y = CGFloat(arc4random_uniform(UInt32(screenHeight / 2)))
            let size = CGFloat(arc4random_uniform(UInt32(100)))
            let colorIndex = Int(arc4random_uniform(UInt32(UIColor.yukiColors.count)))
            
            let circle = UIView(frame: CGRect(x: x, y: y, width: size, height: size))
            circle.layer.cornerRadius = size / 2
            circle.backgroundColor = UIColor.yukiColors[colorIndex]
            circle.layer.borderWidth = 2.0
            
            bubbleContainer.addSubview(circle)
            bubbleContainer.sendSubview(toBack: circle)
        }
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "monthCell", for: indexPath) as! MonthCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MonthCell else { return }
        print(cell.testStackView.frame.width)
    }
}

