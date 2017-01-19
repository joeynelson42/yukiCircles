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
    
    var months: [Month]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CloudManager().fetchMonths { (months) in
            DispatchQueue.main.async {
                self.months = months
                self.collectionView.reloadData()
            }
        }
        
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
            circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            
            bubbleContainer.addSubview(circle)
            bubbleContainer.sendSubview(toBack: circle)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            for circle in self.bubbleContainer.subviews {
                circle.transform = CGAffineTransform.identity
            }
        }, completion: nil)
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
        guard let _ = months else { return cell }
        
        let matrix = months[indexPath.row].getMatrix()
        
        for (rowIndex,row) in matrix.enumerated() {
            for (colIndex,value) in row.enumerated() {
                if let button = cell.buttonFor(row: rowIndex, column: colIndex) {
                    button.delegate = self
                    if value == 0 {
                        button.setToggle(on: false)
                    } else if value == 1 {
                        button.setToggle(on: true)
                    }
                }
                
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        bigBang💥()
    }
}

extension ViewController: HappyCircleDelegate {
    func circleToggled(on: Bool, circle: HappyCircle) {
        guard let index = collectionView.indexPathsForVisibleItems.first else { return }
        guard let cell = collectionView.cellForItem(at: index) as? MonthCell else { return }
        
        guard let rc = cell.indicesFor(circle) else { return }
        let row = rc.row
        let column = rc.column
        
        print(rc)
        
        bigBang💥()
    }
}

