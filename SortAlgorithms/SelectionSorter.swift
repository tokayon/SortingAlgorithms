//
//  SelectionSorter.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 31.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation

//MARK: - Selection sort -
// Description
// Inefficient on large lists
// Worse performance from insertion sort
// Steps
// Divide the input list into two parts,  the sublist of items already sorted,
// which is built up from left to right at the front (left) of the list, and the
// sublist of items remaining to be sorted that occupy the rest of the list.
// Initially, the sorted sublist is empty and the unsorted sublist is the entire input list.
// The algorithm proceeds by finding the smallest (or largest, depending on sorting order)
// element in the unsorted sublist, exchanging it with the leftmost unsorted element
// (putting it in sorted order), and moving the sublist boundaries one element to the right.
// T(n) = c1(n-1) + c2(n(n-1)/2) + c3(n-1) = an^2 + bn + c = O(n^2) - slow algorithm
// Best: n^2, Average: n^2, Worst:n^2
class SelectionSorter: Sorter {
    var cancelled: Bool = false

    //Original algorithm
    func sort(array: [Int]) -> [Int] {
        var iMin = 0
        
        var resultArray = array
        for index in 0..<resultArray.count {
            iMin = index
            for index2 in index+1..<resultArray.count {
                if resultArray[index2] < resultArray[iMin] {
                    iMin = index2
                }
            }
            if iMin != index {
                resultArray.swapAt(index, iMin)
            }
        }
        return resultArray
    }
    
    //Cancellable sorting
    func sort(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }

        var iMin = 0

        var resultArray = array

        for index in 0..<resultArray.count {
            iMin = index
            for index2 in index+1..<resultArray.count {
                guard cancelled == false else { completion(nil) ; return }
                if resultArray[index2] < resultArray[iMin] {
                    iMin = index2
                }
            }
            if iMin != index {
                resultArray.swapAt(index, iMin)
            }
        }
        completion(resultArray)
    }
    
    func cancel() {
        self.cancelled = true
    }
}
