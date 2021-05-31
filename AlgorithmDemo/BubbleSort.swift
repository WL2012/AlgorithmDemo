//
//  BubbleSort.swift
//  AlgorithmDemo
//
//  Created by Liang Wang (QXW7463) on 2021/5/31.
//

import Foundation

/// 时间复杂度O(n2)
func bubbleSort(_ array: inout [Int]) -> [Int] {
    if array.count < 2 {
        return array
    }
    for end in (0..<array.count).reversed() {
        for i in 0..<end {
            if array[i] > array[i+1] {
                array.swapAt(i, i+1)
            }
        }
    }
    return array
}

func testBubbleSort() {
    var testArray = [1,5,7,5,6,9,0]
    print(bubbleSort(&testArray))
}
