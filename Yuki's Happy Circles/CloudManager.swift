//
//  CloudManager.swift
//  Yuki's Happy Circles
//
//  Created by Joey on 1/19/17.
//  Copyright © 2017 NelsonJE. All rights reserved.
//

import Foundation
import CloudKit

class CloudManager {
    
    let privateDB = CKContainer.default().privateCloudDatabase
    
    func fetchMonths(completion: @escaping ([Month]) -> Void) {
        let pred = NSPredicate(value: true)
        let query = CKQuery(recordType: "Month", predicate: pred)
        
        privateDB.perform(query, inZoneWith: nil) { (records, error) in
            if let e = error {
                print(e)
                return
            }
            
            guard let monthRecords = records else {
                completion([])
                return
            }
            
            if records!.isEmpty {
                self.initialize()
                return
            }
            
            var months = [Month]()
            for record in monthRecords {
                let fetchedMonth = Month(monthIndex: record["monthIndex"] as! Int64,
                                         week1: record["week1"] as! [Int64],
                                         week2: record["week2"] as! [Int64],
                                         week3: record["week3"] as! [Int64],
                                         week4: record["week4"] as! [Int64],
                                         money: record["money"] as! [Int64])
                months.append(fetchedMonth)
            }
            
            completion(months)
        }

    }
    
    
    func modify(month: Month, completion: @escaping () -> Void) {
        privateDB.fetch(withRecordID: CKRecordID(recordName: "\(month.monthIndex)"), completionHandler: { record, error in
            if let _ = error {
                print(error!)
                return
            }
            
            if let monthRecord = record {
                monthRecord["monthIndex"] = month.monthIndex as CKRecordValue
                monthRecord["week1"] = month.week1 as CKRecordValue
                monthRecord["week2"] = month.week2 as CKRecordValue
                monthRecord["week3"] = month.week3 as CKRecordValue
                monthRecord["week4"] = month.week4 as CKRecordValue
                monthRecord["money"] = month.money as CKRecordValue
                
                self.privateDB.save(monthRecord, completionHandler: { savedRecord, error in
                    if let _ = error {
                        print(error!)
                        return
                    }
                    print("successfully saved resolution")
                    
                    completion()
                })
            }
            
            completion()
            
        })
    }

    func save(month: Month, completion: @escaping () -> Void) {
        
        let monthRecordID = CKRecordID(recordName: "\(month.monthIndex)")
        let monthRecord = CKRecord(recordType: "Month", recordID: monthRecordID)
        
        monthRecord["monthIndex"] = month.monthIndex as CKRecordValue
        monthRecord["week1"] = month.week1 as CKRecordValue
        monthRecord["week2"] = month.week2 as CKRecordValue
        monthRecord["week3"] = month.week3 as CKRecordValue
        monthRecord["week4"] = month.week4 as CKRecordValue
        monthRecord["money"] = month.week4 as CKRecordValue
        
        privateDB.save(monthRecord, completionHandler: { savedRecord, error in
            if let _ = error {
                print(error!)
                return
            }
            print("successfully saved resolution")
            
            completion()
        })
    }
    
    func initialize() {
        for i in 0...11 {
            let month = Month(monthIndex: Int64(i),
                              week1: [0,0,0,0,0,0,0],
                              week2: [0,0,0,0,0,0,0],
                              week3: [0,0,0,0,0,0,0],
                              week4: [0,0,0,0,0,0,0],
                              money: [0,0,0,0])
            
            save(month: month, completion: { 
                print("save month \(i)")
            })
        }
    }

//    func deleteResolution(res: Resolution, completion: @escaping () -> Void) {
//        //use res.id to find CKRecord to delete
//        
//        privateDB.fetch(withRecordID: CKRecordID(recordName: res.id), completionHandler: { record, error in
//            if let _ = error {
//                print(error!)
//                return
//            }
//            
//            if let resRecord = record {
//                let operation = CKModifyRecordsOperation(recordsToSave: nil, recordIDsToDelete: [resRecord.recordID])
//                
//                operation.savePolicy = .allKeys
//                operation.modifyRecordsCompletionBlock = { added, deleted, error in
//                    if error != nil {
//                        print(error!)
//                    } else {
//                        completion()
//                        print("successfully deleted record")
//                    }
//                }
//                self.privateDB.add(operation)
//            }
//        })
//    }
}


