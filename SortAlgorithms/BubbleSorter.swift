//
//  BubbleSorter.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 31.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation

//MARK: - Bubble sort -
// Description
// A simple sorting algorithm that repeatedly steps through the list to be sorted and
// compares each pair of adjacent items and swaps them in the desired order.
// This is NOT efficient and not a practical sorting algorithm when n is large
// T(n) = (n-1)x(n-1)xC = cn^2 - 2 cn + 1 = O(n^2) - slow algorithm
// Best: n, Average: n^2, Worst:n^2
class BubbleSorter: Sorter {
    var cancelled: Bool = false
    
    //Original algorithm
    func sort(array: [Int]) -> [Int] {
        var resultArray = array
        var swapped: Bool = true
        while swapped {
            swapped = false
            for index in 1..<array.count  {
                guard cancelled == false else { return [] }
                if resultArray[index-1] > resultArray[index] {
                    swap(&resultArray[index-1], &resultArray[index])
                    swapped = true
                }
            }
        }
        return resultArray
    }
    
    
    //Cancellable sorting
    func sort(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }
        
        var resultArray = array
        var swapped: Bool = true
        while swapped && !cancelled {
            swapped = false
            for index in 1..<array.count  {
                guard cancelled == false else { completion(nil) ; return }
                if resultArray[index-1] > resultArray[index] {
                    swap(&resultArray[index-1], &resultArray[index])
                    swapped = true
                }
            }
        }
        completion(resultArray)
    }
    
    func cancel() {
        self.cancelled = true
    }
}
