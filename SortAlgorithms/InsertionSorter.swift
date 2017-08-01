//
//  InsertionSorter.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 31.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation

//MARK: - Insertion Sort -
// Description:
// Simple Implementation
// Efficient on smaller datasets
// more efficient than selection sort and bubble sort
// T(n) = (c1+ c3)(n-1) + c3x(n(n-1)/2) = an^2 + 2bn + c = O(n^2)
//Best =  n, Average = n^2, Worst = n^2
class InsertionSorter: Sorter {
    var cancelled: Bool = false
    
    //Original algorithm
    func sort(array: [Int]) -> [Int] {
        var resultArray = array
        for index in 1..<resultArray.count {
            var index2 = index
            while index2 > 0 && resultArray[index2-1] > resultArray[index2] {
                swap(&resultArray[index2], &resultArray[index2-1])
                index2 -= 1
            }
        }
        return resultArray
    }
    
    
    //Cancellable sorting
    func sort(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }

        var resultArray = array
        for index in 1..<resultArray.count {
            var index2 = index
            while index2 > 0 && resultArray[index2-1] > resultArray[index2] {
                guard cancelled == false else { completion(nil) ; return }
                swap(&resultArray[index2], &resultArray[index2-1])
                index2 -= 1
            }
        }
        completion(resultArray)
    }
    
    func cancel() {
        self.cancelled = true
    }
}
