//
//  QuickSorter.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 31.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation

//MARK: - Quick sort -
// The quicksort algorithm divides a list/array into two smaller arrays (low elements & high elements)
// Step 1: Pick a pivot point (In this sample we have picked a random pivot point between the range of the list)
// Step 2: Divide/Reorder the list so that all the elements smaller than the pivot is added
// to the low elements array and all the elements greater than the pivot are added to the high element array.
// Step 3: Repeat Step 1 and Step 2 for the sub arrays/lists
// Recreate the array by joining (the lowelement array), (the pivot) and (the high element array)
// Best: n Log n, Average: n log n, Worst:n^2
class QuickSorter: Sorter {
    var cancelled: Bool = false
    
    //Original algorithm
    func sort(array: [Int]) -> [Int] {
        var unsorted = array
        return quick(array: &unsorted)
    }
    
    
    //Cancellable sorting
    func sort(array: [Int], completion: @escaping ([Int]?) -> Void) {
        var unsorted = array
        let sorted = quick(array: &unsorted)
        guard cancelled == false else { completion(nil) ; return }
        completion(sorted)
    }
    
    fileprivate func quick(array: inout [Int]) -> [Int] {
        if array.count <= 1 {
            return array
        }
        
        let pivot = array[0]
        
        var smaller: [Int] = []
        var equal: [Int] = []
        var bigger: [Int] = []
        
        for x in array {
            if cancelled { return [] }
            switch x {
            case let x where x < pivot:
                smaller.append(x)
            case let x where x == pivot:
                equal.append(x)
            case let x where x > pivot:
                bigger.append(x)
            default:
                break
            }
        }
        return quick(array: &smaller) + equal + quick(array: &bigger)
    }
    
    
    func cancel() {
        self.cancelled = true
    }
}
