//
//  BucketSorter.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 03.08.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation

/**
 Performs bucket sort algorithm on the given input elements.
 [Bucket Sort Algorithm Reference](https://en.wikipedia.org/wiki/Bucket_sort)
 - Parameter elements:     Array of Sortable elements
 - Parameter distributor:  Performs the distribution of each element of a bucket
 - Parameter sorter:       Performs the sorting inside each bucket, after all the elements are distributed
 - Parameter buckets:      An array of buckets
 - Returns: A new array with sorted elements
 */
class BucketSorter: Sorter {
    var cancelled: Bool = false
    var numberOfBuckets: Int = 10
    
    //Original algorithm
    func sort(array: [Int]) -> [Int] {
        guard array.count > numberOfBuckets else { return [] }
        let capacity = array.count / numberOfBuckets
        
        
        let distributor = Distributor()
        let sorter = QuickSorter()
        let bucket = Bucket(capacity: capacity)
        let buckets = [Bucket](repeatElement(bucket, count: numberOfBuckets))
        let resultArray = bucketSort(array, distributor: distributor, sorter: sorter, buckets: buckets)
        if resultArray != nil {
            return resultArray!
        } else {
            return []
        }
    }
    
    
    //Cancellable sorting
    func sort(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }
        guard array.count > numberOfBuckets else { completion(nil) ; return }
        let capacity = array.count / numberOfBuckets
        
        let distributor = Distributor()
        let sorter = QuickSorter()
        sorter.cancelled = self.cancelled
        let bucket = Bucket(capacity: capacity)
        let buckets = [Bucket](repeatElement(bucket, count: numberOfBuckets))
        let resultArray = bucketSort(array, distributor: distributor, sorter: sorter, buckets: buckets)
        completion(resultArray)
    }
    
    func cancel() {
        self.cancelled = true
    }
}

extension BucketSorter {
    fileprivate func bucketSort(_ elements: [Int], distributor: Distributor, sorter: Sorter, buckets: [Bucket]) -> [Int]? {
        
        var bucketsCopy = buckets
        for element in elements {
            guard cancelled == false else { return nil }
            distributor.distribute(element: element, buckets: &bucketsCopy)
        }
        
        var results: [Int] = []
        
        for var bucket in bucketsCopy {
            guard cancelled == false else { return nil }
            results += bucket.sort(algorithm: sorter)
        }
        
        return results
    }
}

