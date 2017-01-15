//
//  Month.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 1/14/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import Foundation

struct Month {
    
    var week1: [Int]!
    var week2: [Int]!
    var week3: [Int]!
    var week4: [Int]!
    var money: [Int]!
    
    init() {
        week1 = [0,0,0,0,0,0,0]
        week2 = [0,0,0,0,0,0,0]
        week3 = [0,0,0,0,0,0,0]
        week4 = [0,0,0,0,0,0,0]
        money = [0,0,0,0]
    }
    
    mutating func set(row: Int, column: Int, value: Int) {
        switch row {
        case 0:
            week1[column] = value
        case 1:
            week2[column] = value
        case 2:
            week3[column] = value
        case 3:
            week4[column] = value
        default:
            return
        }
    }
}
