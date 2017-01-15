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
    
    
    @IBOutlet weak var testStackView: UIStackView!
    // Views
    let week1 = UIStackView()
    let week2 = UIStackView()
    let week3 = UIStackView()
    let week4 = UIStackView()
    let money = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        configureSubviews()
        applyConstraints()
    }
    
    private func configureSubviews(){
        
    }
    
    private func applyConstraints() {

    }
}

