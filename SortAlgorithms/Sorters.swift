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

//MARK: - Bubble sort -
extension Sorters {
    class func sortBubble(array: [Int], completion: @escaping ([Int]?) -> Void) {
        guard cancelled == false else { completion(nil) ; return }
        completion(nil)
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
