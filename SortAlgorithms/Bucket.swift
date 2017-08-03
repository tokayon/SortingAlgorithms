//
//  Bucket.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 31.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation


public struct Bucket {
    var elements: [Int]
    let capacity: Int
    
    public init(capacity: Int) {
        self.capacity = capacity
        self.elements = []
    }
    
    public mutating func add(item: Int) {
        if elements.count < capacity {
            self.elements.append(item)
        }
    }
    
    public mutating func sort(algorithm: Sorter) -> [Int] {
        return algorithm.sort(array: elements)
    }
    
}
