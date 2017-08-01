//
//  MergeSorter.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 31.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation

//MARK: - Merge sort -
// Description:
// Merge sorting is a good sorting algorithm and has consistent performance
// Divide the list into the smallest unit (1 element)
// Compare each element with the adjacent list to sort and merge the two adjacent lists
// Worst case performance O(n log n)
// Best case performance O(n log n)
// Average case performance O(n log n)
class MergeSorter: Sorter {
    var cancelled: Bool = false
    
    //Original algorithm
    func sort(array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let middle = array.count / 2
        
        let leftSorted = sort(array: Array(array[0..<middle]))
        let rightSorted = sort(array: Array(array[middle..<array.count]))
        
        return merge(left: leftSorted, right: rightSorted)
    }
    
    
    //Cancellable sorting
    func sort(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }

        let result = mergeSortCancellable(array: array)
        completion(result)

    }
    
    func cancel() {
        self.cancelled = true
    }
}

extension MergeSorter {

    fileprivate func mergeSortCancellable(array: [Int]) -> [Int]? {
        guard cancelled == false else { return nil }
        guard array.count > 1 else { return array }

        let middle = array.count / 2

        let leftSorted = mergeSortCancellable(array: Array(array[0..<middle]))
        let rightSorted = mergeSortCancellable(array: Array(array[middle..<array.count]))

        if let leftSorted = leftSorted, let rightSorted = rightSorted {
            return mergeCancellable(left: leftSorted, right: rightSorted)
        } else {
            return nil
        }
    }

    fileprivate func mergeCancellable(left: [Int], right: [Int]) -> [Int]? {

        var result: [Int] = []
        var leftIndex = 0
        var rightIndex = 0

        while leftIndex < left.count && rightIndex < right.count {
            guard cancelled == false else { return nil }

            if left[leftIndex] < right[rightIndex] {
                result.append(left[leftIndex])
                leftIndex += 1
            } else if left[leftIndex] > right[rightIndex] {
                result.append(right[rightIndex])
                rightIndex += 1
            } else {
                result.append(left[leftIndex])
                leftIndex += 1
                result.append(right[rightIndex])
                rightIndex += 1
            }
        }

        while leftIndex < left.count {
            result.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            result.append(right[rightIndex])
            rightIndex += 1
        }
        
        return result
    }
    
    fileprivate func merge(left: [Int], right: [Int]) -> [Int] {
        
        var result: [Int] = []
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < left.count && rightIndex < right.count {
            
            if left[leftIndex] < right[rightIndex] {
                result.append(left[leftIndex])
                leftIndex += 1
            } else if left[leftIndex] > right[rightIndex] {
                result.append(right[rightIndex])
                rightIndex += 1
            } else {
                result.append(left[leftIndex])
                leftIndex += 1
                result.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            result.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            result.append(right[rightIndex])
            rightIndex += 1
        }
        
        return result
    }

}
