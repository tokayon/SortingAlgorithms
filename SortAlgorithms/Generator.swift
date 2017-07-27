//
//  Generator.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 26.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation


class Generator: NSObject {
    
    static let upperBound: UInt32 = 100
    static let parts: Int = 3
    static var  cancelled: Bool = false
    
    
    class func generateArray(size: Int, completion: @escaping ([Int]?) -> Void) {
        var array: [Int] = []
        for _ in 1...size {
            if cancelled {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            array.append(generateNumber())
        }
        DispatchQueue.main.async {
            completion(array)
        }
    }
    
}

extension Generator {
    
    fileprivate class func generateNumber() -> Int {
        return Int(arc4random_uniform(upperBound) + UInt32(1))
    }
}
