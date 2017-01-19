//
//  MonthCell.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 1/14/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import UIKit

class MonthCell: UICollectionViewCell {
    
    // MARK: Properties
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var week1: UIStackView!
    @IBOutlet weak var week2: UIStackView!
    @IBOutlet weak var week3: UIStackView!
    @IBOutlet weak var week4: UIStackView!
    @IBOutlet weak var money: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func buttonFor(row: Int, column: Int) -> HappyCircle? {
        
        var week: UIStackView!
        
        switch row {
        case 0:
            week = week1
        case 1:
            week = week2
        case 2:
            week = week3
        case 3:
            week = week4
        case 4:
            week = money
        default:
            return nil
        }
        
        var actualColumn = column
        
        if column > 3 {
            actualColumn += 1
        }
        return week.arrangedSubviews[actualColumn] as? HappyCircle
    }
    
    func indicesFor(_ button: HappyCircle) -> (row:Int, column:Int)? {
        var row = 0
        var column = 0
        
        if week1.arrangedSubviews.contains(button) {
            row = 0
            column = week1.arrangedSubviews.index(of: button)!
        } else if week2.arrangedSubviews.contains(button) {
            row = 1
            column = week2.arrangedSubviews.index(of: button)!
        } else if week3.arrangedSubviews.contains(button) {
            row = 2
            column = week3.arrangedSubviews.index(of: button)!
        } else if week4.arrangedSubviews.contains(button) {
            row = 3
            column = week4.arrangedSubviews.index(of: button)!
        } else if money.arrangedSubviews.contains(button) {
            row = 4
            column = money.arrangedSubviews.index(of: button)!
        }
        else {
            return nil
        }
        
        if column > 3 {
            column -= 1
        }
        
        return (row,column)
    }
}

