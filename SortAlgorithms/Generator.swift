//
//  Generator.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 26.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation


class Generator: NSObject {
    
    //Upper divider. Size of array = 5000. Upper divider = 10. Upper bound = 500.
    //Array with 5000 numbers from 1 to 500.
    static let upperDivider = 10
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
            array.append(generateNumber(upperBound: size/upperDivider))
        }
        DispatchQueue.main.async {
            completion(array)
        }
    }
    
    class func cancel() {
        self.cancelled = true
    }
}

extension Generator {
    
    fileprivate class func generateNumber(upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound)) + UInt32(1))
    }
}
