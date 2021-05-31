//
//  InsertSort.swift
//  AlgorithmDemo
//
//  Created by Liang Wang (QXW7463) on 2021/5/31.
//

import Foundation

/// 数组有序 O(n)
/// 数组无序 O(n2)
func insertionSort(_ array: inout [Int]) -> [Int] {
    if array.count < 2 {
        return array
    }
    for i in 1..<array.count {
        for j in (0..<i).reversed() {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
            }
        }
    }
    return array
}

func testInsertionSort() {
    var testArray = [1,5,4,3,8,7,5,6,9,10,0]
    print(insertionSort(&testArray))
}
