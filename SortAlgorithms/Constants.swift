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
        static let start = "START"
        static let cancel = "CANCEL"
    }
    
    struct Sorters {
        static let bubble =     "Bubble sort"
        static let selection =  "Selection sort"
        static let insertion =  "Insertion sort"
        static let merge =      "Merge sort"
        static let quick =      "Quick sort"
        static let bucket =     "Bucket sort"
    }
    
    struct Dots {
        static let empty = ""
        static let one = "."
        static let two = ". ."
        static let three = ". . ."
    }
    
    struct SorterDescriptions {
        
        //n^2 = n\u{00B2}
        //n²
        static let bubbleDescription =     "Bubble sort is a simple sorting algorithm that repeatedly steps through the list to be sorted.\nBubble sort has worst-case and average complexity both О(n²), where n is the number of items being sorted.\nBubble sort should be avoided in the case of large collections.\nIt will not be efficient in the case of a reverse-ordered collection."
        
        static let selectionDescription =  "In computer science, selection sort is a sorting algorithm, specifically an in-place comparison sort.\nIt has O(n²) time complexity, making it inefficient on large lists, and generally performs worse than the similar insertion sort. Selection sort is noted for its simplicity, and it has performance advantages over more complicated algorithms in certain situations, particularly where auxiliary memory is limited."
        
        static let insertionDescription = "The best case input is an array that is already sorted. In this case insertion sort has complexity O(n).\nThe simplest worst case input is an array sorted in reverse order.In these cases every iteration of the inner loop will scan and shift the entire sorted subsection of the array before inserting the next element. This gives insertion sort a quadratic running time O(n²).\nHowever, insertion sort is one of the fastest algorithms for sorting very small arrays, even faster than quicksort."
        
        static let mergeDescription =      "In the worst case, merge sort does about 39% fewer comparisons than quicksort does in the average case.\nIn terms of moves, merge sort's worst case complexity is O(n log n)—the same complexity as quicksort's best case, and merge sort's best case takes about half as many iterations as the worst case."
        
        static let quickDescription =      "To sort an array of n distinct elements, quicksort takes O(n log n) time in expectation, averaged over all n! permutations of n elements with equal probability.\nThe most unbalanced partition occurs when the pivot divides the list into two sublists of sizes 0 and n − 1. If this happens repeatedly in every partition, then each recursive call processes a list of size one less than the previous list.\nIn that case Quicksort takes O(n²) time."
        
        static let bucketDescription =     "Bucket sort, or bin sort, is a sorting algorithm that works by distributing the elements of an array into a number of buckets. Each bucket is then sorted individually, either using a different sorting algorithm, or by recursively applying the bucket sorting algorithm.\nNote that for bucket sort to be O(n) on average, the number of buckets n must be equal to the length of the array being sorted, and the input array must be uniformly distributed across the range of possible bucket values."
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
