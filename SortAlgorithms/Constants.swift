//
//  Constants.swift
//  SortAlgorithms
//
//  Created by SergeSinkevych on 22.07.17.
//  Copyright © 2017 SergeSinkevych. All rights reserved.
//

import Foundation


struct Constants {
    
    struct Identifiers {
        static let details = "DetailsSegueID"
        static let optionCell = "optionCellID"
        static let statusCell = "statusCellID"
    }
    
    struct Labels {
        static let sizeOfArray = "Size of Array"
        static let typesOfSorting = "Type of Sorting"
    }
    
    struct Sorters {
        static let bubble =     "Bubble sort"
        static let selection =  "Selection sort"
        static let insertion =  "Insertion sort"
        static let merge =      "Merge sort"
        static let quick =      "Quick sort"
        static let bucket =     "Bucket sort"
    }
    
    struct Sizes {
        static let one =            "1_000"
        static let five =           "5_000"
        static let ten =            "10_000"
        static let fifty =          "50_000"
        static let hundred =        "100_000"
        static let fiveHundred =    "500_000"
        static let million =        "1_000_000"
        static let fiveMillion =    "5_000_000"
        static let tenMillion =     "10_000_000"
    }
}

//To avoid unwrapping
extension String {
    var intValue: Int {
        if let number = Int(self) {
            return number
        } else {
            return 0
        }
    }
}
