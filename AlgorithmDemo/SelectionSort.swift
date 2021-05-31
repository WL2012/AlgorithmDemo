//
//  SelectionSort.swift
//  AlgorithmDemo
//
//  Created by Liang Wang (QXW7463) on 2021/5/31.
//

import Foundation

/// 时间复杂度O(n2)
func selectionSort(_ array: inout [Int]) -> [Int] {
    if array.count < 2 {
        return array
    }
    for i in 0..<array.count {
        var minIndex = i
        for j in (i+1)..<array.count {
            minIndex = array[j] < array[minIndex] ? j : minIndex
        }
        array.swapAt(i, minIndex)
    }
    return array
}

func testSelectionSort() {
    var testArray = [1,5,7,5,6,9,0]
    print(selectionSort(&testArray))
}
