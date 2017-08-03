//
//  Sorter.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 31.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation

public protocol Sorter {
    var cancelled: Bool { get set }
    func sort(array: [Int]) -> [Int]
    func sort(array: [Int], completion: @escaping ([Int]?) -> Void)
    func cancel()
}
