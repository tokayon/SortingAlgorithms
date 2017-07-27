//
//  Sorters.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 26.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation


class Sorters: NSObject {
    static var cancelled: Bool = false
}

//MARK: - Swift sort -
extension Sorters {
    class func sortSwift(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }
        let sorted = array.sorted()
        completion(sorted)
    }
}

//MARK: - Bubble sort -
// Description
// A simple sorting algorithm that repeatedly steps through the list to be sorted and
// compares each pair of adjacent items and swaps them in the desired order.
// This is NOT efficient and not a practical sorting algorithm when n is large
// T(n) = (n-1)x(n-1)xC = cn^2 - 2 cn + 1 = O(n^2) - slow algorithm
// Best: n, Average: n^2, Worst:n^2
extension Sorters {
    class func sortBubble(array: [Int], completion: @escaping ([Int]?) -> Void) {
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
}


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
extension Sorters {
    class func sortSelection(array: [Int], completion: @escaping ([Int]?) -> Void) {
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
                swap(&resultArray[index], &resultArray[iMin])
            }
        }
        
        completion(resultArray)
    }
}

//MARK: - Insertion sort -
extension Sorters {
    class func sortInsertion(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }
        completion(nil)
    }
}

//MARK: - Merge sort -
extension Sorters {
    class func sortMerge(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }
        completion(nil)
    }
}

//MARK: - Quick sort -
extension Sorters {
    class func sortQuick(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }
        completion(nil)
    }
}

//MARK: - Bucket sort -
extension Sorters {
    class func sortBucket(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }
        completion(nil)
    }
}
