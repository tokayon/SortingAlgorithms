//
//  Distributor.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 03.08.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation

// An example of a simple distribution function that send every elements to
// the bucket representing the range in which it fits.
//
// If the range of values to sort is 0..<49 i.e, there could be 5 buckets of capacity = 10
// So every element will be classified by the ranges:
//
// -  0 ..< 10
// - 10 ..< 20
// - 20 ..< 30
// - 30 ..< 40
// - 40 ..< 50
//
// By following the formula: element / capacity = #ofBucket
public struct Distributor {
    
    public init() {}
    
    public func distribute(element: Int, buckets: inout [Bucket]) {
        let bucketIndex = element / buckets.first!.capacity
        buckets[bucketIndex].add(item: element)
    }
}
