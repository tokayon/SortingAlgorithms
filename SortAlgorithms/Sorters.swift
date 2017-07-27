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
extension Sorters {
    class func sortSelection(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }
        completion(nil)
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
