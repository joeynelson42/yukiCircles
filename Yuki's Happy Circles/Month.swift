//
//  Month.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 1/14/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import Foundation

struct Month {
    
    var monthIndex: Int64!
    var week1: [Int64]!
    var week2: [Int64]!
    var week3: [Int64]!
    var week4: [Int64]!
    var money: [Int64]!
    
    init() {
        monthIndex = 0
        week1 = [0,0,0,0,0,0,0]
        week2 = [0,0,0,0,0,0,0]
        week3 = [0,0,0,0,0,0,0]
        week4 = [0,0,0,0,0,0,0]
        money = [0,0,0,0]
    }
    
    init(monthIndex:Int64, week1:[Int64], week2:[Int64], week3:[Int64], week4:[Int64], money:[Int64]) {
        self.monthIndex = monthIndex
        self.week1 = week1
        self.week2 = week2
        self.week3 = week3
        self.week4 = week4
        self.money = money
    }
    
    func getMatrix() -> [[Int64]] {
        return [week1, week2, week3, week4, money]
    }
    
    func getValueFor(row: Int, column:Int) -> Int64 {
        switch row {
        case 0:
            return week1[column]
        case 1:
            return week2[column]
        case 2:
            return week3[column]
        case 3:
            return week4[column]
        default:
            return 0
        }
    }
    
    mutating func set(row: Int, column: Int, value: Int64) {
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
